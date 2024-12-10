import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/domain/entities/genre_entity.dart';

sealed class GenreStates {}

class GenresLoadingState extends GenreStates {
  String? loadingMessage;
  GenresLoadingState({this.loadingMessage});
}

class GenresSuccessState extends GenreStates {
  List<GenreEntity> genres;
  GenresSuccessState({required this.genres});
}

class GenresErrorState extends GenreStates {
  ServerError? serverError;
  Error? error;
  GenresErrorState({this.error, this.serverError});
}

class GenreChangeIndexState extends GenreStates {}
