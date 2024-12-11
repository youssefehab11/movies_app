import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';

class RowTitleComponent extends StatelessWidget {
  final String title;
  const RowTitleComponent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: DarkStyles.robotW400F16,
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Text(
                  StringsManager.seeMore,
                  style: DarkStyles.robotW400F16.copyWith(
                    color: ColorsManager.yellow,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                const Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: ColorsManager.yellow,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
