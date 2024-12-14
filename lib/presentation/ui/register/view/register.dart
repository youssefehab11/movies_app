import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/components/app_button.dart';
import 'package:movies_app/presentation/core/components/app_text_field.dart';
import 'package:movies_app/presentation/core/components/default_app_bar.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/validator.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isVisiblePassword = false;
  bool isVisibleConfirmPassword = false;

  final double spaceBetweenFields = 16;
  @override
  void initState() {
    super.initState();
    initControllers();
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: const DefaultAppBar(title: StringsManager.register),
        body: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image.asset(
                      AssetsManager.logo,
                      height: 118.h,
                    ),
                    SizedBox(height: 50.h),
                    AppTextField(
                      validator: (input) {
                        NameValidaror nameValidaror = NameValidaror(
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
                          fieldErrorMessage:
                              StringsManager.passwordErrorMessage,
                        );
                        return passwordValidator.validate(input);
                      },
                      controller: passwordController,
                      hintText: StringsManager.password,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      prefixSvg: AssetsManager.passwordIc,
                      suffixIcon: isVisiblePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onSuffixIconPressed: () {
                        setState(() {
                          isVisiblePassword = !isVisiblePassword;
                        });
                      },
                      isObsecure: !isVisiblePassword,
                    ),
                    SizedBox(height: spaceBetweenFields.h),
                    AppTextField(
                      validator: (input) {
                        RePasswordValidator rePasswordValidator =
                            RePasswordValidator(
                          fieldName: StringsManager.confirmPassword,
                          password: passwordController.text,
                          fieldErrorMessage:
                              StringsManager.confirmPasswordErrorMessage,
                        );
                        return rePasswordValidator.validate(input);
                      },
                      controller: confirmPasswordController,
                      hintText: StringsManager.confirmPassword,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      prefixSvg: AssetsManager.passwordIc,
                      suffixIcon: isVisiblePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onSuffixIconPressed: () {
                        setState(() {
                          isVisibleConfirmPassword = !isVisibleConfirmPassword;
                        });
                      },
                      isObsecure: !isVisibleConfirmPassword,
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
                    SizedBox(height: spaceBetweenFields.h),
                    SizedBox(
                      width: double.infinity,
                      child: AppButton(
                        btnLabel: StringsManager.createAccount,
                        onBtnPressed: () => onLoginPressed(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          StringsManager.alreadyHaveAccount,
                          style: TextStyle(color: ColorsManager.white),
                        ),
                        MaterialButton(
                          padding: EdgeInsets.zero,
                          minWidth: 0,
                          onPressed: () => onCreateAccountPressed(),
                          splashColor: ColorsManager.yellow.withOpacity(0.2),
                          child: const Text(
                            StringsManager.login,
                            style: TextStyle(color: ColorsManager.yellow),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid');
    }
  }

  void onCreateAccountPressed() {
    Navigator.of(context).pop();
  }

  void initControllers() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
  }
}
