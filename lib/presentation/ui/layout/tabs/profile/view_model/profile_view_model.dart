import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/auth/get_user_info.dart';
import 'package:movies_app/domain/use_cases/auth/sign_out.dart';
import 'package:movies_app/domain/use_cases/movies/get_history.dart';
import 'package:movies_app/domain/use_cases/movies/get_wish_list.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_state.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  SignOutUseCase signOutUseCase;
  GetUserInfoUseCase getUserInfoUseCase;
  GetWishListUseCase getWishListUseCase;
  GetHistoryUseCase getHistoryUseCase;
  List<Movie> wishlistMovies = [];
  List<Movie> historytMovies = [];
  UserEntity? user;

  @factoryMethod
  ProfileViewModel({
    required this.signOutUseCase,
    required this.getUserInfoUseCase,
    required this.getWishListUseCase,
    required this.getHistoryUseCase,
  }) : super(LogoutInitialState());

  void logout() async {
    Result<String> result = await signOutUseCase.execute();
    switch (result) {
      case Success<String>():
        emit(LogoutSuccessState());
      case ServerError<String>():
        emit(LogoutErrorState(serverError: result));
      case Error<String>():
        emit(LogoutErrorState(error: result));
    }
  }

  void getUserInfo() async {
    emit(ProfileInfoLoadingState());
    user = await getUserInfoUseCase.execute();
    if (user != null) {
      emit(ProfileInfoSuccessState(user: user!));
    } else {
      emit(ProfileInfoErrorState());
    }
  }

  Future<void> getWishList() async {
    emit(WishListLoadingState());
    Result<List<Movie>> result = await getWishListUseCase.execute();
    switch (result) {
      case Success<List<Movie>>():
        wishlistMovies = result.data;
        emit(WishListSuccessState(movies: wishlistMovies));
      case ServerError<List<Movie>>():
        emit(WishListErrorState(serverError: result));
      case Error<List<Movie>>():
        emit(WishListErrorState(error: result));
    }
  }

  Future<void> getHistory() async {
    emit(HistoryLoadingState());
    Result<List<Movie>> result = await getHistoryUseCase.execute();
    switch (result) {
      case Success<List<Movie>>():
        historytMovies = result.data;
        emit(HistorySuccessState(movies: historytMovies));
      case ServerError<List<Movie>>():
        emit(HistoryErrorState(serverError: result));
      case Error<List<Movie>>():
        emit(HistoryErrorState(error: result));
    }
  }

  void refreshProfile() async {
    getUserInfo();
    getWishList();
    getHistory();
  }
}
