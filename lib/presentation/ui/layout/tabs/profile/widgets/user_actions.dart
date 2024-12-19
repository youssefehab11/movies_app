import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/presentation/application/app_view_model.dart';
import 'package:movies_app/presentation/core/components/app_button.dart';
import 'package:movies_app/presentation/core/router/routes.dart';
import 'package:movies_app/presentation/core/utils/app_dialogs.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/helper_functions.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_state.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_view_model.dart';

class UserActions extends StatelessWidget {
  const UserActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: AppButton(
              onBtnPressed: () {},
              hasSuffixIcon: true,
              btnLabel: StringsManager.editProfile,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          BlocListener<ProfileViewModel, ProfileState>(
            listener: (context, state) {
              if (state is LogoutSuccessState) {
                context.read<AppViewModel>().clearUser();
                Navigator.of(context).pushReplacementNamed(Routes.login);
              }
              if (state is LogoutErrorState) {
                AppDialogs.showMeesageDialog(
                  context: context,
                  posActionTitle: StringsManager.ok,
                  posAction: () => Navigator.of(context).pop(),
                  message: extractErrorMessage(
                    state.serverError,
                    state.error,
                  ),
                );
              }
            },
            child: Expanded(
              flex: 1,
              child: AppButton(
                onBtnPressed: () => onExitPressed(context),
                btnLabel: StringsManager.exit,
                labelStyle: DarkStyles.robotW400F18.copyWith(
                  color: ColorsManager.white,
                ),
                color: ColorsManager.red,
                hasSuffixIcon: true,
                suffixWidget: SvgPicture.asset(AssetsManager.logoutIc),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onExitPressed(BuildContext context) {
    AppDialogs.showMeesageDialog(
      context: context,
      posActionTitle: StringsManager.confirm,
      negativeActionTitle: StringsManager.cancel,
      posAction: () => logout(context),
      message: StringsManager.areYouSureToLogout,
    );
  }

  void logout(BuildContext context) async {
    context.read<ProfileViewModel>().logout();
  }
}
