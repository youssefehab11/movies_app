import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/use_cases/get_movies_use_case.dart';

class MoviesViewModel extends Cubit<MoviesStates> {
  MoviesViewModel({required this.getMoviesUseCase})
      : super(MoviesLoadingState());
  GetMoviesUseCase getMoviesUseCase;

  void getMovies(String endPoint, Map<String, dynamic> queryParameters) async {
    emit(MoviesLoadingState());
    Result<List<Movie>> result =
        await getMoviesUseCase.execute(endPoint, queryParameters);
    switch (result) {
      case Success<List<Movie>>():
        emit(MoviesSuccessState(movies: result.data));
      case ServerError<List<Movie>>():
        emit(MoviesErrorState(serverError: result));
      case Error<List<Movie>>():
        emit(MoviesErrorState(error: result));
    }
  }
}

sealed class MoviesStates {}

class MoviesLoadingState extends MoviesStates {
  String? loadingMessage;
  MoviesLoadingState({this.loadingMessage});
}

class MoviesSuccessState extends MoviesStates {
  List<Movie> movies;
  MoviesSuccessState({required this.movies});
}

class MoviesErrorState extends MoviesStates {
  ServerError? serverError;
  Error? error;
  MoviesErrorState({this.error, this.serverError});
}
