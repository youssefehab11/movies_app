import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/auth/create_account.dart';
import 'package:movies_app/presentation/ui/register/view_model/register_states.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  CreateAccountUseCase createAccountUseCase;

  @factoryMethod
  RegisterViewModel({required this.createAccountUseCase})
      : super(RegisterInitialStat());

  void createAccountWithEmailAndPassword(String email, String password) async {
    emit(RegisterLoadingState());
    Result<UserCredential> result =
        await createAccountUseCase.execute(email, password);
    switch (result) {
      case Success<UserCredential>():
        print(result.data.user?.email);
        emit(RegisterSuccessState(userCredential: result.data));
      case ServerError<UserCredential>():
        print(result.statusMessage);
        emit(RegisterErrorState(serverError: result));
      case Error<UserCredential>():
        emit(RegisterErrorState(error: result));
    }
  }
}
