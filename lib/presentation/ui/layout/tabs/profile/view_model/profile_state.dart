import 'package:movies_app/domain/entities/movie.dart';
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

class WishListLoadingState extends ProfileState {}

class WishListErrorState extends ProfileState {
  ServerError? serverError;
  Error? error;
  WishListErrorState({this.error, this.serverError});
}

class WishListSuccessState extends ProfileState {
  List<Movie> movies;
  WishListSuccessState({required this.movies});
}

class HistoryLoadingState extends ProfileState {}

class HistoryErrorState extends ProfileState {
  ServerError? serverError;
  Error? error;
  HistoryErrorState({this.error, this.serverError});
}

class HistorySuccessState extends ProfileState {
  List<Movie> movies;
  HistorySuccessState({required this.movies});
}
