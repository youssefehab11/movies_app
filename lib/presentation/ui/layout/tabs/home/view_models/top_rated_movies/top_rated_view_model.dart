import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/movies/get_top_rated_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/top_rated_movies/top_rated_movies_states.dart';

@injectable
class TopRatedMoviesViewModel extends Cubit<TopRatedMoviesStates> {
  @factoryMethod
  TopRatedMoviesViewModel({required this.getTopRatedMoviesUseCase})
      : super(TopRatedMoviesLoadingState());
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  void getTopRatedMovies(
    String endPoint, [
    Map<String, dynamic>? queryParameters,
  ]) async {
    emit(TopRatedMoviesLoadingState());
    Result<List<Movie>> result =
        await getTopRatedMoviesUseCase.execute(endPoint, queryParameters);
    switch (result) {
      case Success<List<Movie>>():
        emit(TopRatedMoviesSucessState(topRatedMovies: result.data));
      case ServerError<List<Movie>>():
        emit(TopRatedMoviesErroState(serverError: result));
      case Error<List<Movie>>():
        emit(TopRatedMoviesErroState(error: result));
    }
  }
}
