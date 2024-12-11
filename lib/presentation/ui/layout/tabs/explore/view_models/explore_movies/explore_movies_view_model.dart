import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/movies/get_explore_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/explore/view_models/explore_movies/explore_movies_states.dart';

@injectable
class ExploreMoviesViewModel extends Cubit<ExploreMoviesStates> {
  @factoryMethod
  ExploreMoviesViewModel({required this.getMoviesUseCase})
      : super(ExploreMoviesLoadingState());
  GetExploreMoviesUseCase getMoviesUseCase;

  void getMovies(String endPoint,
      [Map<String, dynamic>? queryParameters]) async {
    emit(ExploreMoviesLoadingState());
    Result<List<Movie>> result =
        await getMoviesUseCase.execute(endPoint, queryParameters);
    switch (result) {
      case Success<List<Movie>>():
        emit(ExploreMoviesSuccessState(movies: result.data));
      case ServerError<List<Movie>>():
        emit(ExploreMoviesErrorState(serverError: result));
      case Error<List<Movie>>():
        emit(ExploreMoviesErrorState(error: result));
    }
  }
}