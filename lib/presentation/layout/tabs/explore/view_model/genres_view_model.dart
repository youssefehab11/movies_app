import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/domain/entities/genre_entity.dart';
import 'package:movies_app/domain/use_cases/get_genres_use_case.dart';
import 'package:movies_app/presentation/layout/tabs/explore/view_model/genres_states.dart';

class GenresViewModel extends Cubit<GenreStates> {
  GenresViewModel({required this.genresUseCase}) : super(GenresLoadingState());
  GetGenresUseCase genresUseCase;
  int genreSelectedIndex = 0;
  List<GenreEntity>? genres;

  void getGenres(String endPoint) async {
    emit(GenresLoadingState());
    Result<List<GenreEntity>> result =
        await genresUseCase.execute(endPoint: endPoint);
    switch (result) {
      case Success<List<GenreEntity>>():
        {
          genres = result.data;
          emit(GenresSuccessState(genres: genres ?? []));
        }
      case ServerError<List<GenreEntity>>():
        emit(GenresErrorState(serverError: result));
      case Error<List<GenreEntity>>():
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
