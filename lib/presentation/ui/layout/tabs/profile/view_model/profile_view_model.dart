import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/auth/sign_out.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_state.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  SignOutUseCase signOutUseCase;

  @factoryMethod
  ProfileViewModel({required this.signOutUseCase})
      : super(LogoutInitialState());

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
}
