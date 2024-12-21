// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/data_source_contract/api_data_source/genres_data_source.dart'
    as _i101;
import '../data/data_source_contract/api_data_source/movie_details_data_source.dart'
    as _i8;
import '../data/data_source_contract/api_data_source/movies_data_source.dart'
    as _i106;
import '../data/data_source_contract/api_data_source/similar_movies_data_source.dart'
    as _i656;
import '../data/data_source_contract/firebase_data_source/auth/login_data_source.dart'
    as _i197;
import '../data/data_source_contract/firebase_data_source/auth/logout_data_source.dart'
    as _i100;
import '../data/data_source_contract/firebase_data_source/auth/register_data_source.dart'
    as _i538;
import '../data/data_source_contract/firebase_data_source/auth/user_data_source.dart'
    as _i868;
import '../data/data_source_contract/firebase_data_source/firestore/edit_profile_data_source.dart'
    as _i169;
import '../data/data_source_contract/firebase_data_source/firestore/history_data_source.dart'
    as _i509;
import '../data/data_source_contract/firebase_data_source/firestore/wish_list_data_source.dart'
    as _i64;
import '../data/data_source_contract/shared_preferences/shared_preferense_data_source.dart'
    as _i1002;
import '../data/data_source_impl/api_data_source_impl/genres_data_source_impl.dart'
    as _i173;
import '../data/data_source_impl/api_data_source_impl/movie_details_data_source_impl.dart'
    as _i400;
import '../data/data_source_impl/api_data_source_impl/movies_data_source_impl.dart'
    as _i104;
import '../data/data_source_impl/api_data_source_impl/similar_movies_data_source_impl.dart'
    as _i482;
import '../data/data_source_impl/firebase_data_source_impl/auth/login_data_source_impl.dart'
    as _i416;
import '../data/data_source_impl/firebase_data_source_impl/auth/logout_data_source_impl.dart'
    as _i717;
import '../data/data_source_impl/firebase_data_source_impl/auth/register_data_source_impl.dart'
    as _i1038;
import '../data/data_source_impl/firebase_data_source_impl/auth/user_data_source_impl.dart'
    as _i341;
import '../data/data_source_impl/firebase_data_source_impl/firestore/edit_profile_data_source_impl.dart'
    as _i815;
import '../data/data_source_impl/firebase_data_source_impl/firestore/history_data_source_impl.dart'
    as _i952;
import '../data/data_source_impl/firebase_data_source_impl/firestore/wish_list_data_source_impl.dart'
    as _i685;
import '../data/data_source_impl/shared_preferences/shared_preferences_data_source_impl.dart'
    as _i1028;
import '../data/repositry_impl/api_repo_impl/genre_repo_impl.dart' as _i818;
import '../data/repositry_impl/api_repo_impl/movie_details_repo_impl.dart'
    as _i1005;
import '../data/repositry_impl/api_repo_impl/movies_repo_impl.dart' as _i1062;
import '../data/repositry_impl/api_repo_impl/similar_movies_repo_impl.dart'
    as _i1033;
import '../data/repositry_impl/firebase_repo_impl/auth/login_repo_impl.dart'
    as _i508;
import '../data/repositry_impl/firebase_repo_impl/auth/logout_repo_impl.dart'
    as _i1009;
import '../data/repositry_impl/firebase_repo_impl/auth/register_repo_impl.dart'
    as _i902;
import '../data/repositry_impl/firebase_repo_impl/auth/user_repo_impl.dart'
    as _i495;
import '../data/repositry_impl/firebase_repo_impl/firestore/edit_profile_repo_impl.dart'
    as _i1015;
import '../data/repositry_impl/firebase_repo_impl/firestore/history_repo_impl.dart'
    as _i706;
import '../data/repositry_impl/firebase_repo_impl/firestore/wish_list_repo_impl.dart'
    as _i464;
import '../data/repositry_impl/shared_preferences/shared_preferense_repo_impl.dart'
    as _i705;
import '../data/services/api/api_manager.dart' as _i1005;
import '../data/services/firebase/auth_services.dart' as _i862;
import '../data/services/firebase/firestore_service.dart' as _i213;
import '../data/services/shared_preferences/shared_preferences.dart' as _i467;
import '../domain/repositry_contract/api_repo/genres_repo.dart' as _i711;
import '../domain/repositry_contract/api_repo/movie_details_repo.dart' as _i777;
import '../domain/repositry_contract/api_repo/movies_repo.dart' as _i160;
import '../domain/repositry_contract/api_repo/similar_movies_repo.dart'
    as _i217;
import '../domain/repositry_contract/firebase_repo/auth/login_repo.dart'
    as _i35;
import '../domain/repositry_contract/firebase_repo/auth/logout_repo.dart'
    as _i748;
import '../domain/repositry_contract/firebase_repo/auth/register_repo.dart'
    as _i769;
import '../domain/repositry_contract/firebase_repo/auth/user_repo.dart'
    as _i125;
import '../domain/repositry_contract/firebase_repo/firestore/edit_profile_repo.dart'
    as _i242;
import '../domain/repositry_contract/firebase_repo/firestore/history_repo.dart'
    as _i368;
import '../domain/repositry_contract/firebase_repo/firestore/wish_list_repo.dart'
    as _i486;
import '../domain/repositry_contract/shared_preferences/shared_preferences_repo.dart'
    as _i783;
import '../domain/use_cases/auth/create_account.dart' as _i624;
import '../domain/use_cases/auth/edit_profile.dart' as _i202;
import '../domain/use_cases/auth/get_cached_user.dart' as _i983;
import '../domain/use_cases/auth/get_user_info.dart' as _i251;
import '../domain/use_cases/auth/sign_in.dart' as _i559;
import '../domain/use_cases/auth/sign_out.dart' as _i353;
import '../domain/use_cases/genres/get_genres.dart' as _i666;
import '../domain/use_cases/movies/add_movie_to_history.dart' as _i515;
import '../domain/use_cases/movies/add_movie_to_wish_list.dart' as _i900;
import '../domain/use_cases/movies/check_movie_in_wish_list.dart' as _i530;
import '../domain/use_cases/movies/get_explore_movies.dart' as _i340;
import '../domain/use_cases/movies/get_history.dart' as _i549;
import '../domain/use_cases/movies/get_movie_details.dart' as _i888;
import '../domain/use_cases/movies/get_new_release_movies.dart' as _i500;
import '../domain/use_cases/movies/get_popular_movies.dart' as _i646;
import '../domain/use_cases/movies/get_similar_movies.dart' as _i107;
import '../domain/use_cases/movies/get_top_rated_movies.dart' as _i297;
import '../domain/use_cases/movies/get_wish_list.dart' as _i967;
import '../domain/use_cases/movies/remove_movie_from_histroy.dart' as _i321;
import '../domain/use_cases/movies/remove_movie_from_wish_list.dart' as _i406;
import '../domain/use_cases/movies/search_movies.dart' as _i307;
import '../domain/use_cases/shared_preferences/get_onboarding_bool.dart'
    as _i873;
import '../domain/use_cases/shared_preferences/save_onboarding_bool.dart'
    as _i479;
import '../presentation/application/app_view_model.dart' as _i510;
import '../presentation/ui/edit_profile/view_model/view_model.dart' as _i384;
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
import '../presentation/ui/layout/tabs/profile/view_model/profile_view_model.dart'
    as _i888;
import '../presentation/ui/layout/tabs/search/view_model/search_view_model.dart'
    as _i219;
import '../presentation/ui/login/login_view_model/login_view_model.dart'
    as _i24;
import '../presentation/ui/movie_details/view_models/movie_details_view_model_cubit.dart'
    as _i671;
import '../presentation/ui/movie_details/view_models/similar_movies_view_model.dart'
    as _i410;
import '../presentation/ui/register/view_model/register_view_model.dart'
    as _i1014;

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
    gh.singleton<_i1005.ApiManager>(() => _i1005.ApiManager());
    gh.singleton<_i213.FireStoreServies>(() => _i213.FireStoreServies());
    gh.singleton<_i467.AppSharedPreferences>(
        () => _i467.AppSharedPreferences());
    gh.factory<_i1002.SharedPreferenseDataSource>(() =>
        _i1028.SharedPreferencesDataSourceImpl(
            sharedPreferences: gh<_i467.AppSharedPreferences>()));
    gh.factory<_i868.FireStoreUserDataSource>(() =>
        _i341.FireStoreUserDataSourceImpl(
            fireStoreServies: gh<_i213.FireStoreServies>()));
    gh.factory<_i656.SimilarMoviesDataSource>(() =>
        _i482.SimilarMoviesDataSourceImpl(apiManager: gh<_i1005.ApiManager>()));
    gh.factory<_i101.GenresDataSource>(
        () => _i173.GenresDataSourceImpl(apiManager: gh<_i1005.ApiManager>()));
    gh.factory<_i8.MovieDetailsDataSource>(() =>
        _i400.MovieDetailsDataSourceImpl(apiManager: gh<_i1005.ApiManager>()));
    gh.factory<_i64.WishListDataSource>(() => _i685.WishListDataSourceImpl(
        fireStoreServies: gh<_i213.FireStoreServies>()));
    gh.factory<_i509.HistoryDataSource>(() => _i952.HistoryDataSourceImpl(
        fireStoreServies: gh<_i213.FireStoreServies>()));
    gh.singleton<_i862.AuthServices>(() =>
        _i862.AuthServices(fireStoreServies: gh<_i213.FireStoreServies>()));
    gh.factory<_i486.WishListRepo>(() => _i464.WishListRepoImpl(
        wishListDataSource: gh<_i64.WishListDataSource>()));
    gh.factory<_i106.MoviesDataSource>(
        () => _i104.MoviesDataSourceImpl(apiManager: gh<_i1005.ApiManager>()));
    gh.factory<_i217.SimilarMoviesRepo>(() => _i1033.SimilarMoviesRepoImpl(
        similarMoviesDataSource: gh<_i656.SimilarMoviesDataSource>()));
    gh.factory<_i169.EditProfileDataSource>(() =>
        _i815.EditProfileDataSourceImpl(
            fireStoreServies: gh<_i213.FireStoreServies>()));
    gh.factory<_i868.CachedFirebaseUserDataSource>(
        () => _i341.CachedUserImpl(authServices: gh<_i862.AuthServices>()));
    gh.factory<_i160.MoviesRepo>(() =>
        _i1062.MoviesRepoImpl(moviesDataSource: gh<_i106.MoviesDataSource>()));
    gh.factory<_i777.MovieDetailsRepo>(() => _i1005.MovieDetailsRepoImpl(
        movieDetailsDataSource: gh<_i8.MovieDetailsDataSource>()));
    gh.factory<_i888.GetMovieDetailsUseCase>(() => _i888.GetMovieDetailsUseCase(
        movieDetailsRepo: gh<_i777.MovieDetailsRepo>()));
    gh.factory<_i368.HistoryRepo>(() => _i706.HistoryRepoImpl(
        historyDataSource: gh<_i509.HistoryDataSource>()));
    gh.factory<_i538.RegisterDataSource>(() =>
        _i1038.RegisterDataSourceImpl(authServices: gh<_i862.AuthServices>()));
    gh.factory<_i197.LoginDataSource>(
        () => _i416.LoginDataSourceImp(authServices: gh<_i862.AuthServices>()));
    gh.factory<_i900.AddMovieToWishListUseCase>(() =>
        _i900.AddMovieToWishListUseCase(
            wishListRepo: gh<_i486.WishListRepo>()));
    gh.factory<_i530.CheckMovieInWishListUseCase>(() =>
        _i530.CheckMovieInWishListUseCase(
            wishListRepo: gh<_i486.WishListRepo>()));
    gh.factory<_i967.GetWishListUseCase>(
        () => _i967.GetWishListUseCase(wishListRepo: gh<_i486.WishListRepo>()));
    gh.factory<_i406.RemoveMovieFromWishListUseCase>(() =>
        _i406.RemoveMovieFromWishListUseCase(
            wishListRepo: gh<_i486.WishListRepo>()));
    gh.factory<_i100.LogoutDataSource>(() =>
        _i717.LogoutDataSourceImpl(authServices: gh<_i862.AuthServices>()));
    gh.factory<_i783.SharedPreferencesRepo>(() =>
        _i705.SharedPreferencesRepoImpl(
            sharedPreferenseDataSource:
                gh<_i1002.SharedPreferenseDataSource>()));
    gh.factory<_i125.FireStoreUserRepo>(() => _i495.FireStroreUserRepoImpl(
        fireStoreUserDataSource: gh<_i868.FireStoreUserDataSource>()));
    gh.factory<_i515.AddMovieToHistoryUseCase>(() =>
        _i515.AddMovieToHistoryUseCase(historyRepo: gh<_i368.HistoryRepo>()));
    gh.factory<_i549.GetHistoryUseCase>(
        () => _i549.GetHistoryUseCase(historyRepo: gh<_i368.HistoryRepo>()));
    gh.factory<_i321.RemoveMovieFromHistoryUseCase>(() =>
        _i321.RemoveMovieFromHistoryUseCase(
            historyRepo: gh<_i368.HistoryRepo>()));
    gh.factory<_i711.GenresRepo>(() =>
        _i818.GenreRepoImpl(genresDataSource: gh<_i101.GenresDataSource>()));
    gh.factory<_i125.CachedFirebaseUserRepo>(() =>
        _i495.CachedFirebaseUserRepoImpl(
            cachedFirebaseUserDataSource:
                gh<_i868.CachedFirebaseUserDataSource>()));
    gh.factory<_i873.GetOnboardingBoolUseCase>(() =>
        _i873.GetOnboardingBoolUseCase(
            sharedPreferencesRepo: gh<_i783.SharedPreferencesRepo>()));
    gh.factory<_i479.SaveOnboardingBoolUseCase>(() =>
        _i479.SaveOnboardingBoolUseCase(
            sharedPreferencesRepo: gh<_i783.SharedPreferencesRepo>()));
    gh.factory<_i340.GetExploreMoviesUseCase>(() =>
        _i340.GetExploreMoviesUseCase(moviesRepo: gh<_i160.MoviesRepo>()));
    gh.factory<_i500.GetNewReleaseMoviesUseCase>(() =>
        _i500.GetNewReleaseMoviesUseCase(moviesRepo: gh<_i160.MoviesRepo>()));
    gh.factory<_i646.GetPopularMoviesUseCase>(() =>
        _i646.GetPopularMoviesUseCase(moviesRepo: gh<_i160.MoviesRepo>()));
    gh.factory<_i297.GetTopRatedMoviesUseCase>(() =>
        _i297.GetTopRatedMoviesUseCase(moviesRepo: gh<_i160.MoviesRepo>()));
    gh.factory<_i307.SearchMoviesUseCase>(
        () => _i307.SearchMoviesUseCase(moviesRepo: gh<_i160.MoviesRepo>()));
    gh.factory<_i53.ExploreMoviesViewModel>(() => _i53.ExploreMoviesViewModel(
        getMoviesUseCase: gh<_i340.GetExploreMoviesUseCase>()));
    gh.factory<_i242.EditProfileRepo>(() => _i1015.EditProfileRepoImpl(
        editProfileDataSource: gh<_i169.EditProfileDataSource>()));
    gh.factory<_i355.NewReleaseMoviesViewModel>(() =>
        _i355.NewReleaseMoviesViewModel(
            getNewReleaseMoviesUseCase:
                gh<_i500.GetNewReleaseMoviesUseCase>()));
    gh.factory<_i107.GetSimilarMoviesUseCase>(() =>
        _i107.GetSimilarMoviesUseCase(
            similarMoviesRepo: gh<_i217.SimilarMoviesRepo>()));
    gh.factory<_i219.SearchViewModel>(() => _i219.SearchViewModel(
        searchMoviesUseCase: gh<_i307.SearchMoviesUseCase>()));
    gh.factory<_i769.RegisterRepo>(() =>
        _i902.RegisterRepoImpl(authDataSource: gh<_i538.RegisterDataSource>()));
    gh.factory<_i748.LogoutRepo>(() =>
        _i1009.LogoutRepoImpl(logoutDataSource: gh<_i100.LogoutDataSource>()));
    gh.factory<_i983.GetCachedFirebaseUserUseCase>(() =>
        _i983.GetCachedFirebaseUserUseCase(
            cachedFirebaseUserRepo: gh<_i125.CachedFirebaseUserRepo>()));
    gh.factory<_i828.TopRatedMoviesViewModel>(() =>
        _i828.TopRatedMoviesViewModel(
            getTopRatedMoviesUseCase: gh<_i297.GetTopRatedMoviesUseCase>()));
    gh.factory<_i251.GetUserInfoUseCase>(() => _i251.GetUserInfoUseCase(
        fireStoreUserRepo: gh<_i125.FireStoreUserRepo>()));
    gh.factory<_i666.GetGenresUseCase>(
        () => _i666.GetGenresUseCase(genresRepo: gh<_i711.GenresRepo>()));
    gh.factory<_i35.LoginRepo>(() =>
        _i508.LoginRepoImpl(loginDataSource: gh<_i197.LoginDataSource>()));
    gh.factory<_i510.AppViewModel>(() => _i510.AppViewModel(
          getCachedFirebaseUserUseCase:
              gh<_i983.GetCachedFirebaseUserUseCase>(),
          getOnboardingBoolUseCase: gh<_i873.GetOnboardingBoolUseCase>(),
          saveOnboardingBoolUseCase: gh<_i479.SaveOnboardingBoolUseCase>(),
        ));
    gh.factory<_i624.CreateAccountUseCase>(
        () => _i624.CreateAccountUseCase(authRepo: gh<_i769.RegisterRepo>()));
    gh.factory<_i353.SignOutUseCase>(
        () => _i353.SignOutUseCase(logoutRepo: gh<_i748.LogoutRepo>()));
    gh.factory<_i671.MovieDetailsViewModel>(() => _i671.MovieDetailsViewModel(
          getMovieDetailsUseCase: gh<_i888.GetMovieDetailsUseCase>(),
          addMovieToWishListUseCase: gh<_i900.AddMovieToWishListUseCase>(),
          checkMovieInWishListUseCase: gh<_i530.CheckMovieInWishListUseCase>(),
          removeMovieFromWishListUseCase:
              gh<_i406.RemoveMovieFromWishListUseCase>(),
          addMovieToHistoryUseCase: gh<_i515.AddMovieToHistoryUseCase>(),
        ));
    gh.factory<_i202.EditProfileUseCase>(() =>
        _i202.EditProfileUseCase(editProfileRepo: gh<_i242.EditProfileRepo>()));
    gh.factory<_i781.GenresViewModel>(() =>
        _i781.GenresViewModel(genresUseCase: gh<_i666.GetGenresUseCase>()));
    gh.factory<_i279.PopluarMoviesViewModel>(() => _i279.PopluarMoviesViewModel(
        getPopularMoviesUseCase: gh<_i646.GetPopularMoviesUseCase>()));
    gh.factory<_i1014.RegisterViewModel>(() => _i1014.RegisterViewModel(
        createAccountUseCase: gh<_i624.CreateAccountUseCase>()));
    gh.factory<_i410.SimilarMoviesViewModel>(() => _i410.SimilarMoviesViewModel(
        getSimilarMoviesUseCase: gh<_i107.GetSimilarMoviesUseCase>()));
    gh.factory<_i888.ProfileViewModel>(() => _i888.ProfileViewModel(
          signOutUseCase: gh<_i353.SignOutUseCase>(),
          getUserInfoUseCase: gh<_i251.GetUserInfoUseCase>(),
          getWishListUseCase: gh<_i967.GetWishListUseCase>(),
          getHistoryUseCase: gh<_i549.GetHistoryUseCase>(),
        ));
    gh.factory<_i559.LoginUseCase>(
        () => _i559.LoginUseCase(loginRepo: gh<_i35.LoginRepo>()));
    gh.factory<_i384.EditProfileViewModel>(() => _i384.EditProfileViewModel(
        editProfileUseCase: gh<_i202.EditProfileUseCase>()));
    gh.factory<_i24.LoginViewModel>(
        () => _i24.LoginViewModel(loginUseCase: gh<_i559.LoginUseCase>()));
    return this;
  }
}
