import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/components/app_button.dart';
import 'package:movies_app/presentation/core/components/app_text_field.dart';
import 'package:movies_app/presentation/core/router/routes.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/validator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisiblePassword = false;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                          fieldErrorMessage:
                              StringsManager.passwordErrorMessage,
                        );
                        return passwordValidator.validate(input);
                      },
                      controller: passwordController,
                      hintText: StringsManager.password,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
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
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: MaterialButton(
                        onPressed: () {},
                        splashColor: ColorsManager.yellow.withOpacity(0.2),
                        child: const Text(
                          StringsManager.forgetPassword,
                          style: TextStyle(color: ColorsManager.yellow),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: AppButton(
                        btnLabel: StringsManager.login,
                        onBtnPressed: () => onLoginPressed(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          StringsManager.dontHaveAccount,
                          style: TextStyle(color: ColorsManager.white),
                        ),
                        MaterialButton(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          onPressed: () => onCreateAccountPressed(),
                          splashColor: ColorsManager.yellow.withOpacity(0.2),
                          child: const Text(
                            StringsManager.createAccount,
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
    Navigator.pushNamed(context, Routes.register);
  }
}
