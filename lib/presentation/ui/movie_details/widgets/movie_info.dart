import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';
import 'package:movies_app/presentation/core/components/custom_chip.dart';

class MovieInfo extends StatelessWidget {
  final Movie movie;
  const MovieInfo({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            StringsManager.summary,
            style: DarkStyles.interW700F24,
          ),
          SizedBox(height: 8.h),
          Text(
            movie.overview ?? '',
            style: DarkStyles.robotW400F16,
          ),
          SizedBox(height: 16.h),
          Text(
            StringsManager.genres,
            style: DarkStyles.interW700F24,
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 16.w,
            children: movie.genres!.map(
              (genre) {
                return CustomChip(
                  title: genre.name ?? '',
                  labelStyle: DarkStyles.robotW400F18,
                );
              },
            ).toList(),
          ),
          const SafeArea(
            top: false,
            child: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
