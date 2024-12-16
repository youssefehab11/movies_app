import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/auth/sign_in.dart';
import 'package:movies_app/presentation/ui/login/login_view_model/login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  bool isVisiblePassword = false;

  @factoryMethod
  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());

  void login(String email, String password) async {
    emit(LoginLoadinState());
    Result<UserEntity?> result = await loginUseCase.execute(email, password);

    switch (result) {
      case Success<UserEntity?>():
        emit(LoginSuccessState(user: result.data));
      case ServerError<UserEntity?>():
        emit(LoginErrorState(serverError: result));
      case Error<UserEntity?>():
        emit(LoginErrorState(error: result));
    }
  }

  void togglePasswordVisibility() {
    isVisiblePassword = !isVisiblePassword;
    emit(TogglePasswordVisibiltyState());
  }
}
