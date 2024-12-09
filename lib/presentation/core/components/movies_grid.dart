import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/components/movie_cover.dart';
import 'package:movies_app/domain/entities/movie.dart';

class MoviesDefaultGrid extends StatelessWidget {
  final double ratePadding;
  final int crossAxisCount;
  final List<Movie>? movies;
  const MoviesDefaultGrid({
    super.key,
    required this.crossAxisCount,
    this.ratePadding = 15,
    this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 5 / 7,
      ),
      itemCount: movies?.length ?? 20,
      itemBuilder: (context, index) => MovieCover(
        ratePadding: ratePadding,
        movie: movies?[index],
      ),
    );
  }
}
