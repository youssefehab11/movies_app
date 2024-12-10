import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

sealed class ExploreMoviesStates {}

class ExploreMoviesLoadingState extends ExploreMoviesStates {
  String? loadingMessage;
  ExploreMoviesLoadingState({this.loadingMessage});
}

class ExploreMoviesSuccessState extends ExploreMoviesStates {
  List<Movie> movies;
  ExploreMoviesSuccessState({required this.movies});
}

class ExploreMoviesErrorState extends ExploreMoviesStates {
  ServerError? serverError;
  Error? error;
  ExploreMoviesErrorState({this.error, this.serverError});
}
