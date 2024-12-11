import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/movies/get_new_release_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/new_release_movies/new_release_movies_states.dart';

@injectable
class NewReleaseMoviesViewModel extends Cubit<NewReleaseMoviesStates> {
  @factoryMethod
  NewReleaseMoviesViewModel({required this.getNewReleaseMoviesUseCase})
      : super(NewReleaseMoviesLoadingState());
  GetNewReleaseMoviesUseCase getNewReleaseMoviesUseCase;

  void getNewReleaseMovies(
    String endPoint, [
    Map<String, dynamic>? queryParameters,
  ]) async {
    emit(NewReleaseMoviesLoadingState());
    Result<List<Movie>> result =
        await getNewReleaseMoviesUseCase.execute(endPoint, queryParameters);
    switch (result) {
      case Success<List<Movie>>():
        emit(NewReleaseMoviesSucessState(newReleaseMovies: result.data));
      case ServerError<List<Movie>>():
        emit(NewReleaseMoviesErroState(serverError: result));
      case Error<List<Movie>>():
        emit(NewReleaseMoviesErroState(error: result));
    }
  }
}
