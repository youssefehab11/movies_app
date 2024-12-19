import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/presentation/core/components/app_logo.dart';
import 'package:movies_app/presentation/core/router/routes.dart';
import 'package:movies_app/presentation/core/utils/app_dialogs.dart';
import 'package:movies_app/presentation/core/utils/helper_functions.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/ui/login/login_view_model/login_state.dart';
import 'package:movies_app/presentation/ui/login/login_view_model/login_view_model.dart';
import 'package:movies_app/presentation/ui/login/widgets/login_fields.dart';
import 'package:movies_app/presentation/ui/login/widgets/login_user_actions.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginViewModel viewModel;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisiblePassword = false;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    viewModel = getIt<LoginViewModel>();
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
      onTap: () => clearFocus(),
      child: BlocProvider(
        create: (context) => viewModel,
        child: BlocListener<LoginViewModel, LoginState>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              return AppDialogs.showMeesageDialog(
                context: context,
                title: StringsManager.error,
                posActionTitle: StringsManager.ok,
                posAction: () {
                  Navigator.of(context).pop();
                },
                message: extractErrorMessage(state.serverError, state.error),
              );
            }
            if (state is LoginSuccessState) {
              //context.read<AppViewModel>().appUser = state.user;
              return AppDialogs.showMeesageDialog(
                context: context,
                posActionTitle: StringsManager.ok,
                title: StringsManager.success,
                posAction: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, Routes.home);
                },
                message: StringsManager.successfullyLoggedIn,
              );
            }
          },
          child: Scaffold(
            body: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const AppLogo(),
                        SizedBox(height: 50.h),
                        LoginFields(
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                        LoginUserActions(
                          onLoginPressed: onLoginPressed,
                          onCreateAccountPressed: onCreateAccountPressed,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    clearFocus();
    if (formKey.currentState?.validate() ?? false) {
      viewModel.login(emailController.text, passwordController.text);
    }
  }

  void onCreateAccountPressed() {
    Navigator.pushNamed(context, Routes.register);
  }
}
