import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api_manager/api_manager.dart';
import 'package:movies_app/data/api_manager/end_points.dart';
import 'package:movies_app/data/data_source_impl/movies_data_source_impl.dart';
import 'package:movies_app/data/repositry_impl/movies_repo_impl.dart';
import 'package:movies_app/domain/use_cases/movies/get_explore_movies.dart';
import 'package:movies_app/presentation/core/components/movies_grid.dart';
import 'package:movies_app/domain/entities/genre.dart';
import 'package:movies_app/presentation/ui/layout/tabs/explore/view_models/explore_movies/explore_movies_states.dart';
import 'package:movies_app/presentation/ui/layout/tabs/explore/view_models/explore_movies/explore_movies_view_model.dart';

class MoviesGrid extends StatefulWidget {
  final Genre genre;
  const MoviesGrid({
    super.key,
    required this.genre,
  });

  @override
  State<MoviesGrid> createState() => _MoviesGridState();
}

class _MoviesGridState extends State<MoviesGrid> {
  late ExploreMoviesViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = ExploreMoviesViewModel(
      getMoviesUseCase: GetExploreMoviesUseCase(
        moviesRepo: MoviesRepoImpl(
          moviesDataSource: MoviesDataSourceImpl(
            apiManager: ApiManager(),
          ),
        ),
      ),
    );
    viewModel.getMovies(
      EndPoints.exploreMovies,
      {'with_genres': widget.genre.id},
    );
  }

  @override
  void didUpdateWidget(covariant MoviesGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.genre.id != widget.genre.id) {
      viewModel.getMovies(
        EndPoints.exploreMovies,
        {
          'with_genres': widget.genre.id,
        },
      );
    }
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
