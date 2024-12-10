import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/use_cases/get_movies_use_case.dart';

class MoviesViewModel extends Cubit<MoviesStates> {
  MoviesViewModel({required this.getMoviesUseCase})
      : super(MoviesLoadingState());
  GetMoviesUseCase getMoviesUseCase;

  void getMovies(String endPoint, Map<String, dynamic> queryParameters) async {
    emit(MoviesLoadingState());
    Result<List<MovieEntity>> result =
        await getMoviesUseCase.execute(endPoint, queryParameters);
    switch (result) {
      case Success<List<MovieEntity>>():
        emit(MoviesSuccessState(movies: result.data));
      case ServerError<List<MovieEntity>>():
        emit(MoviesErrorState(serverError: result));
      case Error<List<MovieEntity>>():
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
  List<MovieEntity> movies;
  MoviesSuccessState({required this.movies});
}

class MoviesErrorState extends MoviesStates {
  ServerError? serverError;
  Error? error;
  MoviesErrorState({this.error, this.serverError});
}
