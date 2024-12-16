import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/core/components/app_button.dart';
import 'package:movies_app/presentation/core/components/app_text_button.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/ui/register/view_model/register_states.dart';
import 'package:movies_app/presentation/ui/register/view_model/register_view_model.dart';

class RegisterUserActions extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onCreateAccountPressed;
  const RegisterUserActions({
    super.key,
    required this.onLoginPressed,
    required this.onCreateAccountPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<RegisterViewModel, RegisterStates>(
          builder: (context, state) {
            if (state is! RegisterLoadingState) {
              return SizedBox(
                width: double.infinity,
                child: AppButton(
                  btnLabel: StringsManager.createAccount,
                  onBtnPressed: () => onCreateAccountPressed(),
                ),
              );
            }
            return const LoadingWidget();
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              StringsManager.alreadyHaveAccount,
              style: TextStyle(color: ColorsManager.white),
            ),
            AppTextButton(
              label: StringsManager.login,
              onPressed: onLoginPressed,
            )
          ],
        ),
      ],
    );
  }
}
