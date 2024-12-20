import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

sealed class SimilarMoviesStates {}

final class SimilarMoviesLoadingState extends SimilarMoviesStates {}

final class SimilarMoviesSucceseState extends SimilarMoviesStates {
  List<Movie> movies;
  SimilarMoviesSucceseState({required this.movies});
}

final class SimilarMoviesErrorState extends SimilarMoviesStates {
  ServerError? serverError;
  Error? error;
  SimilarMoviesErrorState({this.error, this.serverError});
}
