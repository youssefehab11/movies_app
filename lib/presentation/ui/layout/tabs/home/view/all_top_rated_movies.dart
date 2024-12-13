import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/end_points.dart';
import 'package:movies_app/presentation/core/components/default_app_bar.dart';
import 'package:movies_app/presentation/core/components/error_widget.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/components/movies_grid.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/top_rated_movies/top_rated_movies_states.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/top_rated_movies/top_rated_view_model.dart';

class AllTopRatedMovies extends StatefulWidget {
  final TopRatedMoviesViewModel viewModel;
  const AllTopRatedMovies({
    super.key,
    required this.viewModel,
  });

  @override
  State<AllTopRatedMovies> createState() => _AllTopRatedMoviesState();
}

class _AllTopRatedMoviesState extends State<AllTopRatedMovies> {
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    widget.viewModel.page++;
    widget.viewModel.getTopRatedMovies(endPoint: EndPoints.topRatedMovies);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        widget.viewModel.getTopRatedMovies(
            endPoint: EndPoints.topRatedMovies,
            queryParameters: {
              'page': widget.viewModel.page++,
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: StringsManager.topRated),
      body: BlocProvider.value(
        value: widget.viewModel,
        child: BlocBuilder<TopRatedMoviesViewModel, TopRatedMoviesStates>(
          builder: (context, state) {
            switch (state) {
              case TopRatedMoviesSucessState():
                return MoviesDefaultGrid(
                  crossAxisCount: 2,
                  scrollController: scrollController,
                  movies: widget.viewModel.allMovies,
                );
              case TopRatedMoviesLoadingState():
                return const LoadingWidget();
              case TopRatedMoviesErroState():
                return const AppErrorWidget();
            }
          },
        ),
      ),
    );
  }
}
