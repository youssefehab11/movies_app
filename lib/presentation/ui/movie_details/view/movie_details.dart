import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/domain/end_points.dart';
import 'package:movies_app/presentation/core/components/error_widget.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/ui/movie_details/view_models/movie_details_view_model_cubit.dart';
import 'package:movies_app/presentation/ui/movie_details/view_models/movie_details_state.dart';
import 'package:movies_app/presentation/ui/movie_details/widgets/movie_details_app_bar.dart';
import 'package:movies_app/presentation/ui/movie_details/widgets/movie_info.dart';
import 'package:movies_app/presentation/ui/movie_details/widgets/poster_section.dart';
import 'package:movies_app/presentation/ui/movie_details/widgets/similar_movies.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;
  const MovieDetails({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late MovieDetailsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<MovieDetailsViewModel>();
    viewModel.getMovieDetailsById(
      movieId: widget.movieId,
      endPoint: EndPoints.movieDetails,
    );
    viewModel.checkMovieInWishList(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const MovieDetailsAppBar(),
        body: BlocBuilder<MovieDetailsViewModel, MovieDetailsStates>(
          buildWhen: (previous, current) {
            if (current is MovieDetailsLoadingState ||
                current is MovieDetailsErrorState ||
                current is MovieDetailsSuccessState) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state is MovieDetailsLoadingState) {
              return const LoadingWidget();
            }
            if (state is MovieDetailsErrorState) {
              return AppErrorWidget(
                error: state.error,
                serverError: state.serverError,
              );
            }
            if (state is CheckWishListLoadingState) {
              return const LoadingWidget();
            }
            if (state is MovieDetailsSuccessState) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PosterSection(movie: state.movie),
                    SizedBox(height: 16.h),
                    SimilarMovies(movieId: widget.movieId),
                    MovieInfo(movie: state.movie),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
