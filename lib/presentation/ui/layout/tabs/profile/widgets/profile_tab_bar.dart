import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/core/components/column_component.dart';
import 'package:movies_app/presentation/core/components/error_widget.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/components/movies_grid.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_state.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_view_model.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

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
                  BlocBuilder<ProfileViewModel, ProfileState>(
                    buildWhen: (previous, current) {
                      return current is WishListLoadingState ||
                          current is WishListErrorState ||
                          current is WishListSuccessState;
                    },
                    builder: (context, state) {
                      if (state is WishListLoadingState ||
                          state is ProfileInfoLoadingState) {
                        return const LoadingWidget();
                      }

                      if (state is WishListErrorState) {
                        return AppErrorWidget(
                          error: state.error,
                          serverError: state.serverError,
                        );
                      }
                      if (state is WishListSuccessState) {
                        if (state.movies.isEmpty) {
                          return Image.asset(
                            AssetsManager.empty1,
                          );
                        }
                        return RefreshIndicator(
                          backgroundColor: ColorsManager.mainGrey,
                          displacement: 8,
                          color: ColorsManager.yellow,
                          onRefresh: () => onProfileRefresh(context),
                          child: MoviesDefaultGrid(
                            movies: state.movies,
                            crossAxisCount: 3,
                            ratePadding: 10,
                          ),
                        );
                      }
                      return const Placeholder();
                    },
                  ),
                  const MoviesDefaultGrid(
                    movies: [],
                    crossAxisCount: 3,
                    ratePadding: 10,
                  ),
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

  Future<void> onProfileRefresh(BuildContext context) {
    context.read<ProfileViewModel>().getUserInfo();
    return context.read<ProfileViewModel>().getWishList();
  }
}
