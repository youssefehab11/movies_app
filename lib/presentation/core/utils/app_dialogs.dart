import 'package:flutter/material.dart';
import 'package:movies_app/presentation/core/components/app_text_button.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';

class AppDialogs {
  static void showMeesageDialog({
    required BuildContext context,
    required String posActionTitle,
    required VoidCallback posAction,
    required String message,
    String? title,
    String? negativeActionTitle,
  }) {
    List<Widget> actions = [];
    if (negativeActionTitle != null) {
      actions.add(
        AppTextButton(
          label: negativeActionTitle,
          onPressed: () => Navigator.of(context).pop(),
        ),
      );
    }
    actions.add(
      AppTextButton(label: posActionTitle, onPressed: posAction),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: title != null ? Text(title) : null,
          buttonPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          titleTextStyle:
              DarkStyles.interW700F20.copyWith(color: ColorsManager.yellow),
          contentTextStyle: DarkStyles.robotW400F16,
          content: Text(message),
          actions: actions,
        );
      },
    );
  }
}
