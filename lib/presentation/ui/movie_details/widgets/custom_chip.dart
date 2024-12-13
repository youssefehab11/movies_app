import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';

class CustomChip extends StatelessWidget {
  final String title;
  final String? iconPath;
  final TextStyle labelStyle;
  const CustomChip({
    super.key,
    required this.title,
    required this.labelStyle,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: const EdgeInsets.all(8),
      avatar: iconPath != null ? SvgPicture.asset(iconPath!) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
        side: const BorderSide(
          color: ColorsManager.mainGrey,
        ),
      ),
      label: Text(
        title,
        style: labelStyle,
      ),
      backgroundColor: ColorsManager.mainGrey,
    );
  }
}
