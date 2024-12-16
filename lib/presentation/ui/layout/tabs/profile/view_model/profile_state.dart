import 'package:movies_app/domain/result.dart';

sealed class ProfileState {}

class LogoutInitialState extends ProfileState {}

class LogoutSuccessState extends ProfileState {}

class LogoutErrorState extends ProfileState {
  ServerError? serverError;
  Error? error;
  LogoutErrorState({this.error, this.serverError});
}
