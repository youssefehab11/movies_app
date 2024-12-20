import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/use_cases/movies/search_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/search/view_model/search_state.dart';

@injectable
class SearchViewModel extends Cubit<SearchState> {
  SearchMoviesUseCase searchMoviesUseCase;
  List<Movie> movies = [];
  int page = 1;

  @factoryMethod
  SearchViewModel({required this.searchMoviesUseCase})
      : super(SearchInitialState());

  void searchMovies({
    required String endPoint,
    required Map<String, dynamic> queryParameters,
    required String input,
  }) async {
    if (input.isEmpty == true) {
      emit(SearchInitialState());
    } else {
      if (page == 1) emit(SearchLoadingState());
      Result<List<Movie>> result =
          await searchMoviesUseCase.execute(endPoint, queryParameters);
      switch (result) {
        case Success<List<Movie>>():
          movies.addAll(result.data);
          emit(SearchSuccessState(movies: movies));
        case ServerError<List<Movie>>():
          emit(SearchErrorState(serverError: result));
        case Error<List<Movie>>():
          emit(SearchErrorState(error: result));
      }
    }
  }
}
