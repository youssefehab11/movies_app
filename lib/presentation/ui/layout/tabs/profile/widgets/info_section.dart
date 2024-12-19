import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_state.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/widgets/user_info.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileViewModel, ProfileState>(
      listener: (context, state) {
        if (state is ProfileInfoErrorState) {
          Fluttertoast.showToast(
            msg: StringsManager.somethingWentWrong,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorsManager.mainGrey.withOpacity(1),
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      buildWhen: (previous, current) =>
          current is ProfileInfoSuccessState ||
          current is ProfileInfoLoadingState,
      builder: (context, state) {
        if (state is ProfileInfoSuccessState) {
          return UserInfo(
            user: state.user,
          );
        }
        return const UserInfo();
      },
    );
  }
}
