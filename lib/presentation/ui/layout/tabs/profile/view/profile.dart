import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/widgets/info_section.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/widgets/profile_tab_bar.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/widgets/user_actions.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = getIt<ProfileViewModel>();
    viewModel.getUserInfo();
    viewModel.getWishList();
    viewModel.getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: const Column(
        children: [
          InfoSection(),
          UserActions(),
          ProfileTabBar(),
        ],
      ),
    );
  }
}
