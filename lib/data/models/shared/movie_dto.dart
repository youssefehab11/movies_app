import 'package:movies_app/data/models/movie_details_reponse/production_company.dart';
import 'package:movies_app/data/models/shared/genre_dto.dart';
import 'package:movies_app/domain/entities/movie.dart';

const String imgeBaseUrl = 'https://image.tmdb.org/t/p/w500';

class MovieDTO {
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  num? budget;
  List<GenreDTO>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  List<ProductionCompanie>? productionCompanies;
  String? releaseDate;
  num? revenue;
  num? runtime;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  int? voteCount;

  MovieDTO({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieDTO.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = '$imgeBaseUrl/${json['backdrop_path']}';
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(GenreDTO.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'] != null
        ? json['origin_country'].cast<String>()
        : [];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = '$imgeBaseUrl/${json['poster_path']}';
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanie.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['origin_country'] = originCountry;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] =
          productionCompanies?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

  Movie toMovieEntity() {
    return Movie(
      backdropPath: backdropPath,
      genres: genres
          ?.map(
            (genre) => genre.toGenreEntity(),
          )
          .toList(),
      id: id,
      overview: overview,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      voteAverage: voteAverage,
      voteCount: voteCount,
      runtime: runtime,
    );
  }
}
