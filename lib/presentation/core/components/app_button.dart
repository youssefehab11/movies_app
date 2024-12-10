import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';

class AppButton extends StatelessWidget {
  final Color? color;
  final bool? hasBorder;
  final bool? hasPrefixIcon;
  final bool? hasSuffixIcon;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextStyle? labelStyle;
  final String btnLabel;
  final VoidCallback onBtnPressed;

  const AppButton({
    super.key,
    required this.btnLabel,
    required this.onBtnPressed,
    this.hasBorder,
    this.hasPrefixIcon,
    this.hasSuffixIcon,
    this.color,
    this.labelStyle,
    this.prefixWidget,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onBtnPressed(),
      height: 50.h,
      color: color ?? ColorsManager.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
        side: hasBorder == null
            ? BorderSide.none
            : const BorderSide(
                color: ColorsManager.yellow,
                width: 2,
              ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasPrefixIcon == true)
            Padding(
              padding: REdgeInsets.only(right: 8.0),
              child: prefixWidget,
            ),
          Text(
            btnLabel,
            style: labelStyle ??
                DarkStyles.robotW400F16.copyWith(
                  color: ColorsManager.mainDark,
                ),
          ),
          if (hasSuffixIcon == true)
            Padding(
              padding: REdgeInsets.only(left: 8.0),
              child: suffixWidget,
            ),
        ],
      ),
    );
  }
}
