import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/movies/get_similar_movies.dart';
import 'package:movies_app/presentation/ui/movie_details/view_model/similar_movies_states.dart';

@injectable
class SimilarMoviesViewModel extends Cubit<SimilarMoviesStates> {
  GetSimilarMoviesUseCase getSimilarMoviesUseCase;

  @factoryMethod
  SimilarMoviesViewModel({required this.getSimilarMoviesUseCase})
      : super(SimilarMoviesLoadingState());

  void getSimilarMovies({
    required int movieId,
    Map<String, dynamic>? queryParameters,
  }) async {
    emit(SimilarMoviesLoadingState());

    Result<List<Movie>> result = await getSimilarMoviesUseCase.execute(
        movieId: movieId, queryParameters: queryParameters);
    switch (result) {
      case Success<List<Movie>>():
        emit(SimilarMoviesSucceseState(movies: result.data));
      case ServerError<List<Movie>>():
        emit(SimilarMoviesErrorState(serverError: result));
      case Error<List<Movie>>():
        emit(SimilarMoviesErrorState(error: result));
    }
  }
}
