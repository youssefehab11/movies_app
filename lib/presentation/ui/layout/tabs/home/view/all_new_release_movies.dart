import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api_manager/end_points.dart';
import 'package:movies_app/presentation/core/components/default_app_bar.dart';
import 'package:movies_app/presentation/core/components/error_widget.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/components/movies_grid.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/new_release_movies/new_release_movies_states.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/new_release_movies/new_release_movies_view_model.dart';

class AllNewReleaseMovies extends StatefulWidget {
  final NewReleaseMoviesViewModel viewModel;
  const AllNewReleaseMovies({
    super.key,
    required this.viewModel,
  });
  @override
  State<AllNewReleaseMovies> createState() => _AllNewReleaseMoviesState();
}

class _AllNewReleaseMoviesState extends State<AllNewReleaseMovies> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    widget.viewModel.getNewReleaseMovies(endPoint: EndPoints.newReleaseMovies);
    widget.viewModel.page++;
    scrollController = ScrollController();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          widget.viewModel.getNewReleaseMovies(
              endPoint: EndPoints.newReleaseMovies,
              queryParameters: {
                'page': widget.viewModel.page++,
              });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.viewModel.allMovies.clear();
    widget.viewModel.page = 1;
    scrollController.dispose();
    scrollController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: StringsManager.newReleases),
      body: BlocProvider.value(
        value: widget.viewModel,
        child: BlocBuilder<NewReleaseMoviesViewModel, NewReleaseMoviesStates>(
          builder: (context, state) {
            switch (state) {
              case NewReleaseMoviesSucessState():
                return MoviesDefaultGrid(
                  crossAxisCount: 2,
                  scrollController: scrollController,
                  movies: widget.viewModel.allMovies,
                );
              case NewReleaseMoviesLoadingState():
                return const LoadingWidget();
              case NewReleaseMoviesErroState():
                return const AppErrorWidget();
            }
          },
        ),
      ),
    );
  }
}
