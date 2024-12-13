import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/movies/get_movie_details.dart';
import 'package:movies_app/presentation/ui/movie_details/view_model/movie_details_view_model_state.dart';

@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsStates> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;

  @factoryMethod
  MovieDetailsViewModel({
    required this.getMovieDetailsUseCase,
  }) : super(MovieDetailsLoadingState());

  void getMovieDetailsById({
    required int movieId,
    required String endPoint,
  }) async {
    emit(MovieDetailsLoadingState());
    Result<Movie> result =
        await getMovieDetailsUseCase.execute(movieId, endPoint);
    switch (result) {
      case Success<Movie>():
        emit(MovieDetailsSucceseState(movie: result.data));
      case ServerError<Movie>():
        emit(MovieDetailsErrorState(serverError: result));
      case Error<Movie>():
        emit(MovieDetailsErrorState(error: result));
    }
  }
}
