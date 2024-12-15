import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/domain/result.dart';

sealed class RegisterStates {}

class RegisterInitialStat extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  UserCredential userCredential;
  RegisterSuccessState({required this.userCredential});
}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  ServerError? serverError;
  Error? error;

  RegisterErrorState({this.error, this.serverError});
}
