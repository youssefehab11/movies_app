import 'package:flutter/material.dart';
import 'package:movies_app/presentation/layout/tabs/explore/widgets/genres.dart';
import 'package:movies_app/presentation/layout/tabs/explore/widgets/movies_grid.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int selectedGenre = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Genres(selectedGenre: selectedGenre, onGenrePressed: onGenrePressed),
          const SizedBox(height: 8.0),
          const Expanded(child: MoviesGrid())
        ],
      ),
    );
  }

  void onGenrePressed(int index) {
    if (selectedGenre != index) {
      setState(() {
        selectedGenre = index;
      });
    }
  }
}
