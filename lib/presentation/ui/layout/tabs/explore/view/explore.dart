import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/end_points.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/presentation/ui/layout/tabs/explore/view_models/genres/genres_states.dart';
import 'package:movies_app/presentation/ui/layout/tabs/explore/view_models/genres/genres_view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/explore/widgets/genres.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  late GenresViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<GenresViewModel>();
    viewModel.getGenres(EndPoints.genres);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        bottom: false,
        child: BlocBuilder<GenresViewModel, GenreStates>(
          builder: (context, state) {
            if (state is GenresLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GenresErrorState) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else {
              return Genres(
                selectedGenre: viewModel.genreSelectedIndex,
                onGenrePressed: onGenrePressed,
                genres: viewModel.genres ?? [],
              );
            }
          },
        ),
      ),
    );
  }

  void onGenrePressed(int index) {
    viewModel.changeGenreIndex(index);
  }
}
