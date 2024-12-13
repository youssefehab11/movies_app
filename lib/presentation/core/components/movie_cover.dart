import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/router/routes.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/extensions.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';
import 'package:movies_app/domain/entities/movie.dart';

class MovieCover extends StatelessWidget {
  final double ratePadding;
  final Movie? movie;
  final coverBorderRadius = 16;
  const MovieCover({
    super.key,
    this.ratePadding = 15,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(coverBorderRadius.r),
      onTap: () =>
          Navigator.pushNamed(context, Routes.movieDetails, arguments: movie),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Image.asset(
          //   'assets/images/test_img.png',
          //   // width: 190.w,
          //   // height: 280.h,
          //   fit: BoxFit.cover,
          // ),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(coverBorderRadius.r),
            ),
            child: CachedNetworkImage(
              imageUrl: movie?.posterPath ?? '',
              width: 230.w,
              height: 350.h,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Positioned(
            left: ratePadding.w,
            top: ratePadding.h,
            child: Container(
              decoration: BoxDecoration(
                color: ColorsManager.secondaryGrey.withOpacity(0.71),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: REdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    movie?.voteAverage?.formatedRate ?? '7.7',
                    style: DarkStyles.interW700F16.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  const Icon(
                    Icons.star_rounded,
                    color: ColorsManager.yellow,
                    size: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
