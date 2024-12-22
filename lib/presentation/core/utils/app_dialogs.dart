import 'package:flutter/material.dart';
import 'package:movies_app/presentation/core/components/app_text_button.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';

class AppDialogs {
  static void showMeesageDialog({
    required BuildContext context,
    required String posActionTitle,
    required String message,
    VoidCallback? posAction,
    VoidCallback? negAction,
    String? title,
    String? negativeActionTitle,
  }) {
    List<Widget> actions = [];
    if (negativeActionTitle != null) {
      actions.add(
        AppTextButton(
          label: negativeActionTitle,
          onPressed: () {
            Navigator.of(context).pop();
            negAction?.call();
          },
        ),
      );
    }
    actions.add(
      AppTextButton(
        label: posActionTitle,
        onPressed: () {
          Navigator.of(context).pop();
          posAction?.call();
        },
      ),
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

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Loading...',
                style: DarkStyles.robotW400F16,
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}
