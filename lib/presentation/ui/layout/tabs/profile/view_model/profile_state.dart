import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/result.dart';

sealed class ProfileState {}

class LogoutInitialState extends ProfileState {}

class LogoutSuccessState extends ProfileState {}

class LogoutErrorState extends ProfileState {
  ServerError? serverError;
  Error? error;
  LogoutErrorState({this.error, this.serverError});
}

class ProfileInfoLoadingState extends ProfileState {}

class ProfileInfoErrorState extends ProfileState {}

class ProfileInfoSuccessState extends ProfileState {
  UserEntity user;
  ProfileInfoSuccessState({required this.user});
}
