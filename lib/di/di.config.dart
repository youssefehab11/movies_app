// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api_manager/api_manager.dart' as _i1000;
import '../data/data_source_contract/genres_data_source.dart' as _i908;
import '../data/data_source_contract/movie_details_data_source.dart' as _i915;
import '../data/data_source_contract/movies_data_source.dart' as _i919;
import '../data/data_source_contract/similar_movies_data_source.dart' as _i965;
import '../data/data_source_impl/genres_data_source_impl.dart' as _i263;
import '../data/data_source_impl/movie_details_data_source_impl.dart' as _i665;
import '../data/data_source_impl/movies_data_source_impl.dart' as _i808;
import '../data/data_source_impl/similar_movies_data_source_impl.dart' as _i858;
import '../data/repositry_impl/genre_repo_impl.dart' as _i192;
import '../data/repositry_impl/movie_details_repo_impl.dart' as _i318;
import '../data/repositry_impl/movies_repo_impl.dart' as _i123;
import '../data/repositry_impl/similar_movies_repo_impl.dart' as _i720;
import '../domain/repositry_contract/genres_repo.dart' as _i222;
import '../domain/repositry_contract/movie_details_repo.dart' as _i833;
import '../domain/repositry_contract/movies_repo.dart' as _i800;
import '../domain/repositry_contract/similar_movies_repo.dart' as _i5;
import '../domain/use_cases/genres/get_genres.dart' as _i666;
import '../domain/use_cases/movies/get_explore_movies.dart' as _i340;
import '../domain/use_cases/movies/get_movie_details.dart' as _i888;
import '../domain/use_cases/movies/get_new_release_movies.dart' as _i500;
import '../domain/use_cases/movies/get_popular_movies.dart' as _i646;
import '../domain/use_cases/movies/get_similar_movies.dart' as _i107;
import '../domain/use_cases/movies/get_top_rated_movies.dart' as _i297;
import '../presentation/ui/layout/tabs/explore/view_models/explore_movies/explore_movies_view_model.dart'
    as _i53;
import '../presentation/ui/layout/tabs/explore/view_models/genres/genres_view_model.dart'
    as _i781;
import '../presentation/ui/layout/tabs/home/view_models/new_release_movies/new_release_movies_view_model.dart'
    as _i355;
import '../presentation/ui/layout/tabs/home/view_models/popular_movies/popular_movies_view_model.dart'
    as _i279;
import '../presentation/ui/layout/tabs/home/view_models/top_rated_movies/top_rated_view_model.dart'
    as _i828;
import '../presentation/ui/movie_details/view_model/movie_details_view_model_cubit.dart'
    as _i210;
import '../presentation/ui/movie_details/view_model/similar_movies_view_model.dart'
    as _i933;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1000.ApiManager>(() => _i1000.ApiManager());
    gh.factory<_i915.MovieDetailsDataSource>(() =>
        _i665.MovieDetailsDataSourceImpl(apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i965.SimilarMoviesDataSource>(() =>
        _i858.SimilarMoviesDataSourceImpl(apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i919.MoviesDataSource>(
        () => _i808.MoviesDataSourceImpl(apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i908.GenresDataSource>(
        () => _i263.GenresDataSourceImpl(apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i800.MoviesRepo>(() =>
        _i123.MoviesRepoImpl(moviesDataSource: gh<_i919.MoviesDataSource>()));
    gh.factory<_i5.SimilarMoviesRepo>(() => _i720.SimilarMoviesRepoImpl(
        similarMoviesDataSource: gh<_i965.SimilarMoviesDataSource>()));
    gh.factory<_i833.MovieDetailsRepo>(() => _i318.MovieDetailsRepoImpl(
        movieDetailsDataSource: gh<_i915.MovieDetailsDataSource>()));
    gh.factory<_i888.GetMovieDetailsUseCase>(() => _i888.GetMovieDetailsUseCase(
        movieDetailsRepo: gh<_i833.MovieDetailsRepo>()));
    gh.factory<_i222.GenresRepo>(() =>
        _i192.GenreRepoImpl(genresDataSource: gh<_i908.GenresDataSource>()));
    gh.factory<_i340.GetExploreMoviesUseCase>(() =>
        _i340.GetExploreMoviesUseCase(moviesRepo: gh<_i800.MoviesRepo>()));
    gh.factory<_i500.GetNewReleaseMoviesUseCase>(() =>
        _i500.GetNewReleaseMoviesUseCase(moviesRepo: gh<_i800.MoviesRepo>()));
    gh.factory<_i646.GetPopularMoviesUseCase>(() =>
        _i646.GetPopularMoviesUseCase(moviesRepo: gh<_i800.MoviesRepo>()));
    gh.factory<_i297.GetTopRatedMoviesUseCase>(() =>
        _i297.GetTopRatedMoviesUseCase(moviesRepo: gh<_i800.MoviesRepo>()));
    gh.factory<_i210.MovieDetailsViewModel>(() => _i210.MovieDetailsViewModel(
        getMovieDetailsUseCase: gh<_i888.GetMovieDetailsUseCase>()));
    gh.factory<_i355.NewReleaseMoviesViewModel>(() =>
        _i355.NewReleaseMoviesViewModel(
            getNewReleaseMoviesUseCase:
                gh<_i500.GetNewReleaseMoviesUseCase>()));
    gh.factory<_i666.GetGenresUseCase>(
        () => _i666.GetGenresUseCase(genresRepo: gh<_i222.GenresRepo>()));
    gh.factory<_i828.TopRatedMoviesViewModel>(() =>
        _i828.TopRatedMoviesViewModel(
            getTopRatedMoviesUseCase: gh<_i297.GetTopRatedMoviesUseCase>()));
    gh.factory<_i107.GetSimilarMoviesUseCase>(() =>
        _i107.GetSimilarMoviesUseCase(
            similarMoviesRepo: gh<_i5.SimilarMoviesRepo>()));
    gh.factory<_i781.GenresViewModel>(() =>
        _i781.GenresViewModel(genresUseCase: gh<_i666.GetGenresUseCase>()));
    gh.factory<_i279.PopluarMoviesViewModel>(() => _i279.PopluarMoviesViewModel(
        getPopularMoviesUseCase: gh<_i646.GetPopularMoviesUseCase>()));
    gh.factory<_i53.ExploreMoviesViewModel>(() => _i53.ExploreMoviesViewModel(
        getMoviesUseCase: gh<_i340.GetExploreMoviesUseCase>()));
    gh.factory<_i933.SimilarMoviesViewModel>(() => _i933.SimilarMoviesViewModel(
        getSimilarMoviesUseCase: gh<_i107.GetSimilarMoviesUseCase>()));
    return this;
  }
}
