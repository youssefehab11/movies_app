import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/result.dart';

sealed class RegisterStates {}

class RegisterInitialStat extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  UserEntity user;
  RegisterSuccessState({required this.user});
}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  ServerError? serverError;
  Error? error;

  RegisterErrorState({this.error, this.serverError});
}

class TogglePasswordVisibiltyState extends RegisterStates {}

class ToggleConfirmPasswordVisibiltyState extends RegisterStates {}
