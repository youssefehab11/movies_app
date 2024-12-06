import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/fonts_manager.dart';

class MovieCover extends StatelessWidget {
  const MovieCover({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 7,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/test_img.png',
            // width: 190.w,
            // height: 280.h,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 15.w,
            top: 15.h,
            child: Container(
              decoration: BoxDecoration(
                color: ColorsManager.greyWithOpacity,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: REdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '7.7',
                    style: TextStyle(
                      fontFamily: FontsManager.interFamily,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
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
