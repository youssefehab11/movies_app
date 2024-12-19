import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

sealed class MovieDetailsStates {}

final class MovieDetailsLoadingState extends MovieDetailsStates {}

final class MovieDetailsSuccessState extends MovieDetailsStates {
  Movie movie;
  MovieDetailsSuccessState({required this.movie});
}

final class MovieDetailsErrorState extends MovieDetailsStates {
  ServerError? serverError;
  Error? error;
  MovieDetailsErrorState({this.error, this.serverError});
}

final class AddWishListLoadingState extends MovieDetailsStates {}

final class AddWishListSuccessState extends MovieDetailsStates {
  String message;
  AddWishListSuccessState({required this.message});
}

final class AddWishListErrorState extends MovieDetailsStates {
  ServerError? serverError;
  Error? error;
  AddWishListErrorState({this.error, this.serverError});
}

final class RemoveWishListLoadingState extends MovieDetailsStates {}

final class RemoveWishListSuccessState extends MovieDetailsStates {
  String message;
  RemoveWishListSuccessState({required this.message});
}

final class RemoveWishListErrorState extends MovieDetailsStates {
  ServerError? serverError;
  Error? error;
  RemoveWishListErrorState({this.error, this.serverError});
}

final class CheckWishListLoadingState extends MovieDetailsStates {}

final class CheckWishListSucceseState extends MovieDetailsStates {
  bool isInWishList;
  CheckWishListSucceseState({required this.isInWishList});
}

final class CheckWishListErrorState extends MovieDetailsStates {
  ServerError? serverError;
  Error? error;
  CheckWishListErrorState({this.error, this.serverError});
}
