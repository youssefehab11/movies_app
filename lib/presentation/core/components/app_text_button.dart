import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const AppTextButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      minWidth: 0,
      onPressed: () => onPressed(),
      splashColor: ColorsManager.yellow.withOpacity(0.2),
      child: Text(
        label,
        style: TextStyle(color: ColorsManager.yellow, fontSize: 16.sp),
      ),
    );
  }
}
