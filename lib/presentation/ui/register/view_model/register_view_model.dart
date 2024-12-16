import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/auth/create_account.dart';
import 'package:movies_app/presentation/ui/register/view_model/register_states.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  CreateAccountUseCase createAccountUseCase;
  bool isVisiblePassword = false;
  bool isVisibleConfirmPassword = false;

  @factoryMethod
  RegisterViewModel({required this.createAccountUseCase})
      : super(RegisterInitialStat());

  void createAccountWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    emit(RegisterLoadingState());
    Result<UserEntity> result = await createAccountUseCase.execute(
      email: email,
      name: name,
      password: password,
      phoneNumber: phoneNumber,
    );
    switch (result) {
      case Success<UserEntity>():
        emit(RegisterSuccessState(user: result.data));
      case ServerError<UserEntity>():
        emit(RegisterErrorState(serverError: result));
      case Error<UserEntity>():
        emit(RegisterErrorState(error: result));
    }
  }

  void togglePasswordVisibilty() {
    isVisiblePassword = !isVisiblePassword;
    emit(TogglePasswordVisibiltyState());
  }

  void toggleConfirmPasswordVisibilty() {
    isVisibleConfirmPassword = !isVisibleConfirmPassword;
    emit(ToggleConfirmPasswordVisibiltyState());
  }
}
