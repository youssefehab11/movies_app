import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/popular_movies/popular_movies_states.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view_models/popular_movies/popular_movies_view_model.dart';

class PopularMoviesBgImage extends StatelessWidget {
  const PopularMoviesBgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopluarMoviesViewModel, PopularMoviesStates>(
      buildWhen: (previous, current) {
        return current is ChangeCurrentMovieState;
      },
      builder: (context, state) {
        if (state is ChangeCurrentMovieState) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            switchInCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Image.network(
              key: ValueKey(state.currentImage),
              state.currentImage ?? '',
              width: double.infinity,
              height: 645.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
