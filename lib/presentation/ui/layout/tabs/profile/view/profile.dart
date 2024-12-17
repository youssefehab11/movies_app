import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/presentation/application/app_view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_state.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/widgets/profile_tab_bar.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/widgets/user_actions.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/widgets/user_info.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileViewModel viewModel;
  late UserEntity? appUser;
  @override
  void initState() {
    super.initState();
    viewModel = getIt<ProfileViewModel>();
    appUser = context.read<AppViewModel>().appUser;
    if (appUser == null) {
      viewModel
          .getUserInfo(context.read<AppViewModel>().firebaseUser?.uid ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            BlocConsumer<ProfileViewModel, ProfileState>(
              listener: (context, state) {
                if (state is ProfileInfoSuccessState && appUser == null) {
                  context.read<AppViewModel>().appUser = state.user;
                }
              },
              builder: (context, state) {
                if (state is ProfileInfoLoadingState ||
                    state is ProfileInfoErrorState) {
                  return const UserInfo();
                }
                if (state is ProfileInfoSuccessState) {
                  return UserInfo(
                    user: state.user,
                  );
                }
                return UserInfo(
                  user: appUser,
                );
              },
            ),
            const UserActions(),
            const ProfileTabBar(),
          ],
        ),
      ),
    );
  }
}
