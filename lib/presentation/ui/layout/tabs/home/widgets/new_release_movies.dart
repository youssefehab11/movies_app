import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/data/api_manager/end_points.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/presentation/core/components/error_widget.dart';
import 'package:movies_app/presentation/core/components/horizontal_movies_list.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/components/row_title_component.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/new_release_movies/new_release_movies_states.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/new_release_movies/new_release_movies_view_model.dart';

class NewReleaseMovies extends StatefulWidget {
  const NewReleaseMovies({super.key});

  @override
  State<NewReleaseMovies> createState() => _NewReleaseMoviesState();
}

class _NewReleaseMoviesState extends State<NewReleaseMovies> {
  late NewReleaseMoviesViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<NewReleaseMoviesViewModel>();
    viewModel.getNewReleaseMovies(EndPoints.newReleaseMovies);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SizedBox(
        height: 360.h,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: RowTitleComponent(
                title: StringsManager.newReleases,
              ),
            ),
            BlocBuilder<NewReleaseMoviesViewModel, NewReleaseMoviesStates>(
              builder: (context, state) {
                switch (state) {
                  case NewReleaseMoviesSucessState():
                    {
                      return HorizontalMoviesList(
                        movies: state.newReleaseMovies,
                      );
                    }
                  case NewReleaseMoviesLoadingState():
                    {
                      return const Expanded(child: LoadingWidget());
                    }
                  case NewReleaseMoviesErroState():
                    {
                      return Expanded(
                        child: AppErrorWidget(
                          error: state.error,
                          serverError: state.serverError,
                        ),
                      );
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
