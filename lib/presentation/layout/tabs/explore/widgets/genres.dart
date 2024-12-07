import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/styles_manager.dart';

typedef OnGenrePressed = Function(int index);

class Genres extends StatelessWidget {
  final int selectedGenre;
  final OnGenrePressed onGenrePressed;
  const Genres({
    super.key,
    required this.selectedGenre,
    required this.onGenrePressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onGenrePressed(index),
            child: AnimatedContainer(
              alignment: Alignment.center,
              curve: Curves.easeInOut,
              padding: REdgeInsets.all(10.0),
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: ColorsManager.yellow, width: 2),
                color: index == selectedGenre
                    ? ColorsManager.yellow
                    : ColorsManager.transparent,
              ),
              child: Text(
                'Action',
                style: DarkStyles.interW700F20.copyWith(
                  color: index == selectedGenre
                      ? ColorsManager.black
                      : ColorsManager.yellow,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
