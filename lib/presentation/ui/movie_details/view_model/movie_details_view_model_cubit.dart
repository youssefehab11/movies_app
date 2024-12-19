import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/movies/add_movie_to_wish_list.dart';
import 'package:movies_app/domain/use_cases/movies/check_movie_in_wish_list.dart';
import 'package:movies_app/domain/use_cases/movies/get_movie_details.dart';
import 'package:movies_app/domain/use_cases/movies/remove_movie_from_wish_list.dart';
import 'package:movies_app/presentation/ui/movie_details/view_model/movie_details_state.dart';

@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsStates> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  AddMovieToWishListUseCase addMovieToWishListUseCase;
  CheckMovieInWishListUseCase checkMovieInWishListUseCase;
  RemoveMovieFromWishListUseCase removeMovieFromWishListUseCase;
  Movie? movie;
  bool isInWishList = false;

  @factoryMethod
  MovieDetailsViewModel({
    required this.getMovieDetailsUseCase,
    required this.addMovieToWishListUseCase,
    required this.checkMovieInWishListUseCase,
    required this.removeMovieFromWishListUseCase,
  }) : super(MovieDetailsLoadingState());

  void getMovieDetailsById({
    required int movieId,
    required String endPoint,
  }) async {
    emit(MovieDetailsLoadingState());
    Result<Movie> result =
        await getMovieDetailsUseCase.execute(movieId, endPoint);
    switch (result) {
      case Success<Movie>():
        movie = result.data;
        emit(MovieDetailsSuccessState(movie: result.data));
      case ServerError<Movie>():
        emit(MovieDetailsErrorState(serverError: result));
      case Error<Movie>():
        emit(MovieDetailsErrorState(error: result));
    }
  }

  void addMovieToWishList(Movie movie) async {
    emit(AddWishListLoadingState());
    Result<String> result = await addMovieToWishListUseCase.execute(movie);
    switch (result) {
      case Success<String>():
        isInWishList = true;
        emit(AddWishListSuccessState(message: result.data));
      case ServerError<String>():
        emit(AddWishListErrorState(serverError: result));
      case Error<String>():
        emit(AddWishListErrorState(error: result));
    }
  }

  void removeFromWishList(Movie movie) async {
    emit(RemoveWishListLoadingState());
    Result<String> result = await removeMovieFromWishListUseCase.execute(movie);
    switch (result) {
      case Success<String>():
        isInWishList = false;
        emit(RemoveWishListSuccessState(message: result.data));
      case ServerError<String>():
        emit(RemoveWishListErrorState(serverError: result));
      case Error<String>():
        emit(RemoveWishListErrorState(error: result));
    }
  }

  void checkMovieInWishList(int movieId) async {
    emit(CheckWishListLoadingState());
    Result<bool> result = await checkMovieInWishListUseCase.execute(movieId);
    switch (result) {
      case Success<bool>():
        isInWishList = result.data;
        emit(CheckWishListSucceseState(isInWishList: result.data));
      case ServerError<bool>():
        emit(CheckWishListErrorState(serverError: result));
      case Error<bool>():
        emit(CheckWishListErrorState(error: result));
    }
  }
}
