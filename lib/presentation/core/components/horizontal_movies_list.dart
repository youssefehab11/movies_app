import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/core/components/movie_cover.dart';

class HorizontalMoviesList extends StatelessWidget {
  final List<Movie> movies;
  const HorizontalMoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: movies.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 16.0,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MovieCover(
            movie: movies[index],
          );
        },
      ),
    );
  }
}
