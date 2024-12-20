import 'package:movies_app/domain/result.dart';

sealed class EditProfileState {}

class EditProfileInitialState extends EditProfileState {}

class EditProfileLoadingState extends EditProfileState {}

class EditProfileErrorState extends EditProfileState {
  ServerError? serverError;
  Error? error;

  EditProfileErrorState({this.serverError, this.error});
}

class EditProfileSuccessState extends EditProfileState {
  String message;
  EditProfileSuccessState({required this.message});
}
