import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalMoviesList extends StatelessWidget {
  const HorizontalMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        separatorBuilder: (context, index) => const SizedBox(
          width: 16.0,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Image.asset(
            'assets/images/test_img.png',
            width: 146.w,
            height: 220.h,
          );
        },
      ),
    );
  }
}
