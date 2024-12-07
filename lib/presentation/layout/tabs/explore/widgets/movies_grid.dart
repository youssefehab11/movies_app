import 'package:flutter/material.dart';
import 'package:movies_app/core/components/movies_grid.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const MoviesDefaultGrid(
      crossAxisCount: 2,
    );
  }
}
