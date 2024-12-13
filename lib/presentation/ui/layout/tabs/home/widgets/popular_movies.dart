import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/data/api_manager/end_points.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/presentation/core/utils/constants.dart';
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
  late PopluarMoviesViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = getIt<PopluarMoviesViewModel>();
    viewModel.getPopularMovies(EndPoints.popularMovies);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SizedBox(
        height: Constants.bgImageHight.h,
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
