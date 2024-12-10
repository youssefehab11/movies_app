import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api_manager/end_points.dart';
import 'package:movies_app/presentation/core/components/movies_grid.dart';
import 'package:movies_app/domain/entities/genre.dart';
import 'package:movies_app/presentation/ui/layout/view_model/movies_view_model.dart';

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
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesViewModel>(context).getMovies(
      EndPoints.exploreMovies,
      {'with_genres': widget.genre.id},
    );
  }

  @override
  void didUpdateWidget(covariant MoviesGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.genre.id != widget.genre.id) {
      BlocProvider.of<MoviesViewModel>(context).getMovies(
        EndPoints.exploreMovies,
        {
          'with_genres': widget.genre.id,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesViewModel, MoviesStates>(
      builder: (context, state) {
        switch (state) {
          case MoviesLoadingState():
            return const Center(
              child: CircularProgressIndicator(),
            );
          case MoviesSuccessState():
            return MoviesDefaultGrid(
              crossAxisCount: 2,
              movies: state.movies,
            );
          case MoviesErrorState():
            return const Center(
              child: Text('Something went wrong'),
            );
        }
      },
    );
  }
}
