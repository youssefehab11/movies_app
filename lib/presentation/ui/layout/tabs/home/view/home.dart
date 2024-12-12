import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/popular_movies/popular_movies_view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/widgets/new_release_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/widgets/popular_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/widgets/top_rated_movies.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          PopularMovies(),
          NewReleaseMovies(),
          SizedBox(height: 8.0),
          TopRatedMovies(),
          SafeArea(
            bottom: false,
            child: SizedBox(
              height: kBottomNavigationBarHeight,
            ),
          ),
        ],
      ),
    );
  }

  void onMovieChange(
    BuildContext context,
    int index,
    List<Movie> popularMovies,
  ) {
    context.read<PopluarMoviesViewModel>().changeCurrentMovie(
          index,
          popularMovies,
        );
  }
}
