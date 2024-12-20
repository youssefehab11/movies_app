import 'package:flutter/material.dart';
import 'package:movies_app/presentation/core/components/column_component.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/widgets/history_tab_content.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/widgets/wishlist_tab_content.dart';

class ProfileTabBar extends StatelessWidget {
  final Future<void> Function() onProfileRefresh;
  const ProfileTabBar({
    super.key,
    required this.onProfileRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Expanded(
        child: Column(
          children: [
            TabBar(
              padding: const EdgeInsets.only(bottom: 8),
              indicatorColor: ColorsManager.yellow,
              tabs: [
                ColumnComponent(
                  head: const Icon(
                    Icons.list_rounded,
                    color: ColorsManager.yellow,
                    size: 28,
                  ),
                  spaceHight: 4,
                  tailLabel: StringsManager.wishList,
                  tailStyle: DarkStyles.robotW400F18,
                ),
                ColumnComponent(
                  head: const Icon(
                    Icons.folder,
                    color: ColorsManager.yellow,
                    size: 28,
                  ),
                  spaceHight: 4,
                  tailLabel: StringsManager.history,
                  tailStyle: DarkStyles.robotW400F18,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  WishlistTabContent(onRefresh: onProfileRefresh),
                  HistoryTabContent(onRefresh: onProfileRefresh),
                ],
              ),
            ),
            const SafeArea(
              top: false,
              child: SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }

  // Future<void> onProfileRefresh() {
  //   context.read<ProfileViewModel>().getUserInfo();
  //   context.read<ProfileViewModel>().getHistory();
  //   return context.read<ProfileViewModel>().getWishList();
  // }
}
