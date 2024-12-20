import 'package:flutter/material.dart';
import 'package:movies_app/presentation/core/animation/navigation.dart';
import 'package:movies_app/presentation/core/router/routes.dart';
import 'package:movies_app/presentation/ui/layout/main_layout.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view/all_new_release_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view/all_top_rated_movies.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/new_release_movies/new_release_movies_view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/top_rated_movies/top_rated_view_model.dart';
import 'package:movies_app/presentation/ui/login/view/login.dart';
import 'package:movies_app/presentation/ui/movie_details/view/movie_details.dart';
import 'package:movies_app/presentation/ui/stream_video/view/stream_video.dart';
import 'package:movies_app/presentation/ui/register/view/register.dart';

class RouteManager {
  static Route<MaterialPageRoute<Widget>>? onGenerateRoute(
      RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const Login());
      case Routes.register:
        return RouteBuilder.slideRight(newRoute: const Register());
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
        int movieId = settings.arguments as int;
        return RouteBuilder.slideRight(
            newRoute: MovieDetails(movieId: movieId));
      case Routes.streamVideo:
        return MaterialPageRoute(builder: (_) => const StreamVideo());
      default:
        return null;
    }
  }
}

// class UnDefinedWidget extends StatelessWidget {
//   const UnDefinedWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('No Route Found!'),
//       ),
//     );
//   }
// }
