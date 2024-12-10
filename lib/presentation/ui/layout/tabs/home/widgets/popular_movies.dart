import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/data/api_manager/api_manager.dart';
import 'package:movies_app/data/api_manager/end_points.dart';
import 'package:movies_app/data/data_source_impl/movies_data_source_impl.dart';
import 'package:movies_app/data/repositry_impl/movies_repo_impl.dart';
import 'package:movies_app/domain/use_cases/movies/get_popular_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/popular_movies/popular_movies_view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/widgets/popular_movies_bg_color.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/widgets/popular_movies_bg_image.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/widgets/popular_movies_content.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key});

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  late PopluarMoviesViewModel popularMoviesViewModel;
  @override
  void initState() {
    super.initState();
    popularMoviesViewModel = PopluarMoviesViewModel(
      getPopularMoviesUseCase: GetPopularMoviesUseCase(
        moviesRepo: MoviesRepoImpl(
          moviesDataSource: MoviesDataSourceImpl(
            apiManager: ApiManager(),
          ),
        ),
      ),
    );
    popularMoviesViewModel.getPopularMovies(EndPoints.popularMovies);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => popularMoviesViewModel,
      child: SizedBox(
        height: 650.h,
        child: const Stack(
          alignment: Alignment.topCenter,
          children: [
            PopularMoviesBgImage(),
            PopularMoviesBgColor(),
            PopularMoviesContent(),
          ],
        ),
      ),
    );
  }
}
