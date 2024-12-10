import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/movies/get_popular_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/popular_movies/popular_movies_states.dart';

class PopluarMoviesViewModel extends Cubit<PopularMoviesStates> {
  PopluarMoviesViewModel({required this.getPopularMoviesUseCase})
      : super(PopularMoviesLoadingState());
  GetPopularMoviesUseCase getPopularMoviesUseCase;

  void getPopularMovies(
    String endPoint, [
    Map<String, dynamic>? queryParameters,
  ]) async {
    emit(PopularMoviesLoadingState());
    Result<List<Movie>> result =
        await getPopularMoviesUseCase.execute(endPoint, queryParameters);
    switch (result) {
      case Success<List<Movie>>():
        emit(
            ChangeCurrentMovieState(currentImage: result.data[0].backdropPath));
        emit(PopularMoviesSucessState(popularMovies: result.data));
      case ServerError<List<Movie>>():
        emit(PopularMoviesErroState(serverError: result));
      case Error<List<Movie>>():
        emit(PopularMoviesErroState(error: result));
    }
  }

  void changeCurrentMovie(int index, List<Movie> movies) {
    emit(ChangeCurrentMovieState(currentImage: movies[index].backdropPath));
  }
}
