import 'package:movies_app/domain/result.dart';

sealed class TopRatedMoviesStates {}

class TopRatedMoviesSucessState extends TopRatedMoviesStates {}

class TopRatedMoviesLoadingState extends TopRatedMoviesStates {}

class TopRatedMoviesErroState extends TopRatedMoviesStates {
  ServerError? serverError;
  Error? error;
  TopRatedMoviesErroState({this.error, this.serverError});
}
