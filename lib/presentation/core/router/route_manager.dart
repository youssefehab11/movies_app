import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/core/animation/navigation.dart';
import 'package:movies_app/presentation/core/router/routes.dart';
import 'package:movies_app/presentation/ui/layout/main_layout.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view/all_new_release_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view/all_top_rated_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/new_release_movies/new_release_movies_view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/top_rated_movies/top_rated_view_model.dart';
import 'package:movies_app/presentation/ui/movie_details/view/movie_details.dart';

class RouteManager {
  static Route<MaterialPageRoute<Widget>> onGenerateRoute(
      RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case Routes.allNewReleaseMovies:
        NewReleaseMoviesViewModel viewModel =
            settings.arguments as NewReleaseMoviesViewModel;
        return RouteBuilder.slideRight(
            newRoute: AllNewReleaseMovies(viewModel: viewModel));
      case Routes.allTopRatedMovies:
        TopRatedMoviesViewModel viewModel =
            settings.arguments as TopRatedMoviesViewModel;
        return RouteBuilder.slideRight(
            newRoute: AllTopRatedMovies(viewModel: viewModel));
      case Routes.movieDetails:
        Movie movie = settings.arguments as Movie;
        return RouteBuilder.slideRight(newRoute: MovieDetails(movie: movie));
      default:
        return MaterialPageRoute(builder: (_) => const UnDefinedWidget());
    }
  }
}

class UnDefinedWidget extends StatelessWidget {
  const UnDefinedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No Route Found!'),
      ),
    );
  }
}
