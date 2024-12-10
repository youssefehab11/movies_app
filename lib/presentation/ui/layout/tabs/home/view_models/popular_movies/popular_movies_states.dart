import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

sealed class PopularMoviesStates {}

class PopularMoviesSucessState extends PopularMoviesStates {
  List<Movie> popularMovies;
  PopularMoviesSucessState({required this.popularMovies});
}

class PopularMoviesLoadingState extends PopularMoviesStates {}

class PopularMoviesErroState extends PopularMoviesStates {
  ServerError? serverError;
  Error? error;
  PopularMoviesErroState({this.error, this.serverError});
}

class ChangeCurrentMovieState extends PopularMoviesStates {
  String? currentImage;
  ChangeCurrentMovieState({this.currentImage});
}
