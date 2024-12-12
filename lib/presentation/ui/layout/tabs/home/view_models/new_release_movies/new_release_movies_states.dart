import 'package:movies_app/domain/result.dart';

sealed class NewReleaseMoviesStates {}

class NewReleaseMoviesSucessState extends NewReleaseMoviesStates {}

class NewReleaseMoviesLoadingState extends NewReleaseMoviesStates {}

class NewReleaseMoviesErroState extends NewReleaseMoviesStates {
  ServerError? serverError;
  Error? error;
  NewReleaseMoviesErroState({this.error, this.serverError});
}
