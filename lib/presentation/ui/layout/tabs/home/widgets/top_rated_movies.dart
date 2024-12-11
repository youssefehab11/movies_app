import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/data/api_manager/end_points.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/presentation/core/components/error_widget.dart';
import 'package:movies_app/presentation/core/components/horizontal_movies_list.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/components/row_title_component.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/top_rated_movies/top_rated_movies_states.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/top_rated_movies/top_rated_view_model.dart';

class TopRatedMovies extends StatefulWidget {
  const TopRatedMovies({super.key});

  @override
  State<TopRatedMovies> createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  late TopRatedMoviesViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = getIt<TopRatedMoviesViewModel>();
    viewModel.getTopRatedMovies(EndPoints.topRatedMovies);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SizedBox(
        height: 360.h,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: RowTitleComponent(
                title: StringsManager.topRated,
              ),
            ),
            BlocBuilder<TopRatedMoviesViewModel, TopRatedMoviesStates>(
              builder: (context, state) {
                switch (state) {
                  case TopRatedMoviesSucessState():
                    return HorizontalMoviesList(
                      movies: state.topRatedMovies,
                    );
                  case TopRatedMoviesLoadingState():
                    return const Expanded(child: LoadingWidget());
                  case TopRatedMoviesErroState():
                    return Expanded(
                      child: AppErrorWidget(
                        error: state.error,
                        serverError: state.serverError,
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
