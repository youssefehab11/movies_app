import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/entities/genre.dart';

sealed class GenreStates {}

class GenresLoadingState extends GenreStates {
  String? loadingMessage;
  GenresLoadingState({this.loadingMessage});
}

class GenresSuccessState extends GenreStates {
  List<Genre> genres;
  GenresSuccessState({required this.genres});
}

class GenresErrorState extends GenreStates {
  ServerError? serverError;
  Error? error;
  GenresErrorState({this.error, this.serverError});
}

class GenreChangeIndexState extends GenreStates {}
