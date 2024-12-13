import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/presentation/core/components/error_widget.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/components/movies_grid.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';
import 'package:movies_app/presentation/ui/movie_details/view_model/similar_movies_states.dart';
import 'package:movies_app/presentation/ui/movie_details/view_model/similar_movies_view_model.dart';

class SimilarMovies extends StatefulWidget {
  final int movieId;
  const SimilarMovies({super.key, required this.movieId});

  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {
  late SimilarMoviesViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<SimilarMoviesViewModel>();
    viewModel.getSimilarMovies(movieId: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<SimilarMoviesViewModel, SimilarMoviesStates>(
        builder: (context, state) {
          switch (state) {
            case SimilarMoviesLoadingState():
              return const LoadingWidget();
            case SimilarMoviesSucceseState():
              if (state.movies.isEmpty) {
                return const SizedBox.shrink();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      StringsManager.similar,
                      style: DarkStyles.interW700F24,
                    ),
                  ),
                  SizedBox(
                    height: 500.h,
                    child: MoviesDefaultGrid(
                      ratePadding: 8,
                      crossAxisCount: 2,
                      movies: state.movies,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              );
            case SimilarMoviesErrorState():
              return const AppErrorWidget();
          }
        },
      ),
    );
  }
}
