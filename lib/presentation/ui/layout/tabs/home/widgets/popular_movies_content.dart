import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/components/movie_cover.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/popular_movies/popular_movies_states.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/popular_movies/popular_movies_view_model.dart';

class PopularMoviesContent extends StatelessWidget {
  const PopularMoviesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsManager.availableNow,
            height: 135.h,
          ),
          SizedBox(
            height: 351.h,
            child: BlocBuilder<PopluarMoviesViewModel, PopularMoviesStates>(
              buildWhen: (previous, current) {
                return current is! ChangeCurrentMovieState;
              },
              builder: (context, state) {
                switch (state) {
                  case PopularMoviesSucessState():
                    {
                      return CarouselSlider.builder(
                        options: CarouselOptions(
                          onPageChanged: (index, reason) => onMovieChange(
                              context, index, state.popularMovies),
                          autoPlay: false,
                          enlargeCenterPage: true,
                          viewportFraction: 0.58,
                          height: 351.h,
                        ),
                        itemCount: state.popularMovies.length,
                        itemBuilder: (
                          BuildContext context,
                          int itemIndex,
                          int pageViewIndex,
                        ) {
                          return MovieCover(
                            movie: state.popularMovies[itemIndex],
                          );
                        },
                      );
                    }
                  case PopularMoviesLoadingState():
                    {
                      return const LoadingWidget();
                    }
                  case PopularMoviesErroState():
                    {
                      return const Center(
                        child: Text('Something went wrong'),
                      );
                    }
                  default:
                    return const Placeholder();
                }
              },
            ),
          ),
          Image.asset(
            AssetsManager.watchNow,
            height: 120.h,
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
