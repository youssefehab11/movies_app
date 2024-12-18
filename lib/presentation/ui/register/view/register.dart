import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/presentation/application/app_view_model.dart';
import 'package:movies_app/presentation/core/components/app_logo.dart';
import 'package:movies_app/presentation/core/components/default_app_bar.dart';
import 'package:movies_app/presentation/core/router/routes.dart';
import 'package:movies_app/presentation/core/utils/app_dialogs.dart';
import 'package:movies_app/presentation/core/utils/helper_functions.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/ui/register/view_model/register_states.dart';
import 'package:movies_app/presentation/ui/register/view_model/register_view_model.dart';
import 'package:movies_app/presentation/ui/register/widgets/register_fields.dart';
import 'package:movies_app/presentation/ui/register/widgets/user_actions.dart';

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

  late RegisterViewModel viewModel;

  bool isVisiblePassword = false;
  bool isVisibleConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    initControllers();
    viewModel = getIt<RegisterViewModel>();
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => clearFocus(),
      child: BlocProvider(
        create: (context) => viewModel,
        child: BlocListener<RegisterViewModel, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterErrorState) {
              AppDialogs.showMeesageDialog(
                context: context,
                title: StringsManager.error,
                posActionTitle: StringsManager.ok,
                posAction: () => Navigator.of(context).pop(),
                message: extractErrorMessage(
                  state.serverError,
                  state.error,
                ),
              );
            }
            if (state is RegisterSuccessState) {
              context.read<AppViewModel>().appUser = state.user;
              AppDialogs.showMeesageDialog(
                context: context,
                title: StringsManager.success,
                posActionTitle: StringsManager.ok,
                posAction: () =>
                    Navigator.pushReplacementNamed(context, Routes.home),
                message: StringsManager.accountCreated,
              );
            }
          },
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
                        const AppLogo(),
                        SizedBox(height: 50.h),
                        RegisterFields(
                          confirmPasswordController: confirmPasswordController,
                          emailController: emailController,
                          nameController: nameController,
                          passwordController: passwordController,
                          phoneController: phoneController,
                        ),
                        SizedBox(height: 16.h),
                        RegisterUserActions(
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

  void onCreateAccountPressed() {
    clearFocus();
    if (formKey.currentState?.validate() ?? false) {
      createAccount();
    }
  }

  void createAccount() {
    viewModel.createAccountWithEmailAndPassword(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phoneNumber: phoneController.text,
    );
  }

  void onLoginPressed() {
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
