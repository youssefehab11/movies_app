import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

sealed class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchErrorState extends SearchState {
  ServerError? serverError;
  Error? error;
  SearchErrorState({this.error, this.serverError});
}

class SearchSuccessState extends SearchState {
  List<Movie> movies;
  SearchSuccessState({required this.movies});
}
