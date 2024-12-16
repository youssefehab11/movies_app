import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/result.dart';

sealed class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadinState extends LoginState {}

class LoginErrorState extends LoginState {
  ServerError? serverError;
  Error? error;
  LoginErrorState({this.serverError, this.error});
}

class LoginSuccessState extends LoginState {
  UserEntity? user;
  LoginSuccessState({required this.user});
}

class TogglePasswordVisibiltyState extends LoginState {}
