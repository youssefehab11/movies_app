import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

sealed class MovieDetailsStates {}

final class MovieDetailsLoadingState extends MovieDetailsStates {}

final class MovieDetailsSucceseState extends MovieDetailsStates {
  Movie movie;
  MovieDetailsSucceseState({required this.movie});
}

final class MovieDetailsErrorState extends MovieDetailsStates {
  ServerError? serverError;
  Error? error;
  MovieDetailsErrorState({this.error, this.serverError});
}
