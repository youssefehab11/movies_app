import 'package:flutter/material.dart';
import 'package:movies_app/presentation/core/router/routes.dart';
import 'package:movies_app/presentation/ui/layout/main_layout.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view/all_new_release_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view/all_top_rated_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/new_release_movies/new_release_movies_view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/top_rated_movies/top_rated_view_model.dart';

class RouteManager {
  static Route<MaterialPageRoute> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case Routes.allNewReleaseMovies:
        NewReleaseMoviesViewModel arguments =
            settings.arguments as NewReleaseMoviesViewModel;
        return MaterialPageRoute(
          builder: (_) => AllNewReleaseMovies(viewModel: arguments),
        );
      case Routes.allTopRatedMovies:
        TopRatedMoviesViewModel arguments =
            settings.arguments as TopRatedMoviesViewModel;
        return MaterialPageRoute(
          builder: (_) => AllTopRatedMovies(viewModel: arguments),
        );
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
