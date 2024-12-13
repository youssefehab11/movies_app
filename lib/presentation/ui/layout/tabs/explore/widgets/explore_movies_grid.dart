import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/end_points.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/presentation/core/components/movies_grid.dart';
import 'package:movies_app/domain/entities/genre.dart';
import 'package:movies_app/presentation/ui/layout/tabs/explore/view_models/explore_movies/explore_movies_states.dart';
import 'package:movies_app/presentation/ui/layout/tabs/explore/view_models/explore_movies/explore_movies_view_model.dart';

class ExploreMoviesGrid extends StatefulWidget {
  final Genre genre;
  const ExploreMoviesGrid({
    super.key,
    required this.genre,
  });

  @override
  State<ExploreMoviesGrid> createState() => _ExploreMoviesGridState();
}

class _ExploreMoviesGridState extends State<ExploreMoviesGrid> {
  late ExploreMoviesViewModel viewModel;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<ExploreMoviesViewModel>();
    viewModel.getMovies(
      endPoint: EndPoints.exploreMovies,
      queryParameters: {'with_genres': widget.genre.id},
    );
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        viewModel.getMovies(
          endPoint: EndPoints.exploreMovies,
          queryParameters: {
            'with_genres': widget.genre.id,
            'page': ++viewModel.page,
          },
        );
      }
    });
  }

  @override
  void didUpdateWidget(covariant ExploreMoviesGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.genre.id != widget.genre.id) {
      viewModel.exploreMovies.clear();
      viewModel.page = 1;
      viewModel.getMovies(
        endPoint: EndPoints.exploreMovies,
        queryParameters: {
          'with_genres': widget.genre.id,
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(() {});
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<ExploreMoviesViewModel, ExploreMoviesStates>(
        builder: (context, state) {
          switch (state) {
            case ExploreMoviesLoadingState():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ExploreMoviesSuccessState():
              return MoviesDefaultGrid(
                scrollController: scrollController,
                crossAxisCount: 2,
                movies: state.movies,
              );
            case ExploreMoviesErrorState():
              return const Center(
                child: Text('Something went wrong'),
              );
          }
        },
      ),
    );
  }
}
