import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/components/app_button.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';

class Content extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? description;
  final TextStyle? descriptionStyle;
  final String forwardBtnTitle;
  final String? backBtnTitle;
  final VoidCallback forwardBtnAction;
  final VoidCallback? backBtnAction;
  const Content({
    super.key,
    required this.title,
    required this.description,
    required this.forwardBtnTitle,
    required this.forwardBtnAction,
    this.titleStyle,
    this.descriptionStyle,
    this.backBtnTitle,
    this.backBtnAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,
            textAlign: TextAlign.center,
            style: titleStyle ?? DarkStyles.interW700F24),
        const SizedBox(height: 16),
        description != null
            ? Text(
                description!,
                textAlign: TextAlign.center,
                style: descriptionStyle ??
                    DarkStyles.robotW400F18.copyWith(fontSize: 20.sp),
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: AppButton(
            btnLabel: forwardBtnTitle,
            onBtnPressed: () => forwardBtnAction(),
          ),
        ),
        const SizedBox(height: 16),
        backBtnTitle != null
            ? SizedBox(
                width: double.infinity,
                child: AppButton(
                  btnLabel: backBtnTitle!,
                  labelStyle: DarkStyles.interW500F20,
                  onBtnPressed: () => backBtnAction?.call(),
                  hasBorder: true,
                  color: ColorsManager.mainDark,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
