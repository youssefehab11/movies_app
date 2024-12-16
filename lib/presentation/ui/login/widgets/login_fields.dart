import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/components/app_text_button.dart';
import 'package:movies_app/presentation/core/components/app_text_field.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/validator.dart';
import 'package:movies_app/presentation/ui/login/login_view_model/login_view_model.dart';

class LoginFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          validator: (input) {
            EmailValidator emailValidator = EmailValidator(
              fieldName: StringsManager.email,
              fieldErrorMessage: StringsManager.emailErrorMessage,
            );
            return emailValidator.validate(input);
          },
          controller: emailController,
          hintText: StringsManager.email,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          prefixSvg: AssetsManager.emailIc,
        ),
        SizedBox(height: 16.h),
        AppTextField(
          validator: (input) {
            PasswordValidator passwordValidator = PasswordValidator(
              fieldName: StringsManager.password,
              fieldErrorMessage: StringsManager.passwordErrorMessage,
            );
            return passwordValidator.validate(input);
          },
          controller: passwordController,
          hintText: StringsManager.password,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          prefixSvg: AssetsManager.passwordIc,
          suffixIcon: context.watch<LoginViewModel>().isVisiblePassword
              ? Icons.visibility
              : Icons.visibility_off,
          onSuffixIconPressed: () => onSuffixIconPressed(context),
          isObsecure: !context.watch<LoginViewModel>().isVisiblePassword,
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: AppTextButton(
            label: StringsManager.forgetPassword,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  void onSuffixIconPressed(BuildContext context) {
    context.read<LoginViewModel>().togglePasswordVisibility();
  }
}
