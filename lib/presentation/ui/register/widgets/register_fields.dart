import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/components/app_text_field.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/validator.dart';
import 'package:movies_app/presentation/ui/register/view_model/register_view_model.dart';

class RegisterFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final double spaceBetweenFields = 16;
  const RegisterFields({
    super.key,
    required this.confirmPasswordController,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    RegisterViewModel viewModel = BlocProvider.of<RegisterViewModel>(context);
    return Column(
      children: [
        AppTextField(
          validator: (input) {
            NameValidator nameValidaror = NameValidator(
              fieldName: StringsManager.name,
            );
            return nameValidaror.validate(input);
          },
          controller: nameController,
          hintText: StringsManager.name,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          prefixSvg: AssetsManager.nameIc,
        ),
        SizedBox(height: spaceBetweenFields.h),
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
        SizedBox(height: spaceBetweenFields.h),
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
          textInputAction: TextInputAction.next,
          prefixSvg: AssetsManager.passwordIc,
          suffixIcon: viewModel.isVisiblePassword
              ? Icons.visibility
              : Icons.visibility_off,
          onSuffixIconPressed: () {
            viewModel.togglePasswordVisibilty();
          },
          isObsecure: !context.watch<RegisterViewModel>().isVisiblePassword,
        ),
        SizedBox(height: spaceBetweenFields.h),
        AppTextField(
          validator: (input) {
            RePasswordValidator rePasswordValidator = RePasswordValidator(
              fieldName: StringsManager.confirmPassword,
              password: passwordController.text,
              fieldErrorMessage: StringsManager.confirmPasswordErrorMessage,
            );
            return rePasswordValidator.validate(input);
          },
          controller: confirmPasswordController,
          hintText: StringsManager.confirmPassword,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          prefixSvg: AssetsManager.passwordIc,
          suffixIcon: viewModel.isVisibleConfirmPassword
              ? Icons.visibility
              : Icons.visibility_off,
          onSuffixIconPressed: () {
            viewModel.toggleConfirmPasswordVisibilty();
          },
          isObsecure:
              !context.watch<RegisterViewModel>().isVisibleConfirmPassword,
        ),
        SizedBox(height: spaceBetweenFields.h),
        AppTextField(
          validator: (input) {
            PhoneValidator phoneValidator =
                PhoneValidator(fieldName: StringsManager.phone);
            return phoneValidator.validate(input);
          },
          controller: phoneController,
          hintText: StringsManager.phone,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          prefixSvg: AssetsManager.phoneIc,
        ),
      ],
    );
  }
}
