import 'package:flutter/material.dart';
import 'package:movies_app/core/components/column_component.dart';
import 'package:movies_app/core/components/movies_grid.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/styles_manager.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: ColorsManager.yellow,
              tabs: [
                ColumnComponent(
                  head: const Icon(
                    Icons.list_rounded,
                    color: ColorsManager.yellow,
                    size: 28,
                  ),
                  spaceHight: 4,
                  tailLabel: 'Wish List',
                  tailStyle: DarkStyles.robotW400F16,
                ),
                ColumnComponent(
                  head: const Icon(
                    Icons.folder,
                    color: ColorsManager.yellow,
                    size: 28,
                  ),
                  spaceHight: 4,
                  tailLabel: 'History',
                  tailStyle: DarkStyles.robotW400F16,
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  MoviesDefaultGrid(
                    crossAxisCount: 3,
                    ratePadding: 10,
                  ),
                  MoviesDefaultGrid(
                    crossAxisCount: 3,
                    ratePadding: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
