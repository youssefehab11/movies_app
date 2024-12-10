import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/entities/genre.dart';
import 'package:movies_app/domain/use_cases/get_genres_use_case.dart';
import 'package:movies_app/presentation/ui/layout/tabs/explore/view_model/genres_states.dart';

class GenresViewModel extends Cubit<GenreStates> {
  GenresViewModel({required this.genresUseCase}) : super(GenresLoadingState());
  GetGenresUseCase genresUseCase;
  int genreSelectedIndex = 0;
  List<Genre>? genres;

  void getGenres(String endPoint) async {
    emit(GenresLoadingState());
    Result<List<Genre>> result =
        await genresUseCase.execute(endPoint: endPoint);
    switch (result) {
      case Success<List<Genre>>():
        {
          genres = result.data;
          emit(GenresSuccessState(genres: genres ?? []));
        }
      case ServerError<List<Genre>>():
        emit(GenresErrorState(serverError: result));
      case Error<List<Genre>>():
        emit(GenresErrorState(error: result));
    }
  }

  void changeGenreIndex(index) {
    if (genreSelectedIndex != index) {
      genreSelectedIndex = index;
      emit(GenreChangeIndexState());
    }
  }
}
