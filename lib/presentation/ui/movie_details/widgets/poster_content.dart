import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';

class PosterContent extends StatelessWidget {
  final String movieTitle;
  final String releaseDate;
  const PosterContent({
    super.key,
    required this.movieTitle,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SvgPicture.asset(
            AssetsManager.playIc,
            height: 90.h,
          ),
        ),
        Text(
          movieTitle,
          textAlign: TextAlign.center,
          style: DarkStyles.interW700F24,
        ),
        SizedBox(height: 15.h),
        Text(
          releaseDate,
          style:
              DarkStyles.interW700F16.copyWith(color: ColorsManager.greyText),
        ),
      ],
    );
  }
}
