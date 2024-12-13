import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/constants.dart';

class PopularMoviesBgColor extends StatelessWidget {
  const PopularMoviesBgColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Constants.bgImageHight.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorsManager.secondaryGrey.withOpacity(0.8),
            ColorsManager.secondaryGrey.withOpacity(0.6),
            ColorsManager.secondaryGrey.withOpacity(1),
          ],
        ),
      ),
    );
  }
}
