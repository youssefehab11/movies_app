import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/core/components/app_button.dart';
import 'package:movies_app/presentation/core/components/app_text_button.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/ui/login/login_view_model/login_state.dart';
import 'package:movies_app/presentation/ui/login/login_view_model/login_view_model.dart';

class LoginUserActions extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onCreateAccountPressed;
  const LoginUserActions({
    super.key,
    required this.onLoginPressed,
    required this.onCreateAccountPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<LoginViewModel, LoginState>(
          builder: (context, state) {
            if (state is LoginLoadinState) {
              return const LoadingWidget();
            }
            return SizedBox(
              width: double.infinity,
              child: AppButton(
                btnLabel: StringsManager.login,
                onBtnPressed: () => onLoginPressed(),
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              StringsManager.dontHaveAccount,
              style: TextStyle(color: ColorsManager.white),
            ),
            const SizedBox(width: 4),
            AppTextButton(
              label: StringsManager.createAccount,
              onPressed: onCreateAccountPressed,
            )
          ],
        )
      ],
    );
  }
}
