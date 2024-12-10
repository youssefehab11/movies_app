import 'package:flutter/material.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/widgets/profile_tab_bar.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/widgets/user_actions.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/widgets/user_info.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Column(
        children: [
          UserInfo(),
          UserActions(),
          ProfileTabBar(),
        ],
      ),
    );
  }
}
