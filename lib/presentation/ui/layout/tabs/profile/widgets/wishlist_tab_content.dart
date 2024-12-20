import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/core/components/error_widget.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/components/movies_grid.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_state.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_view_model.dart';

class WishlistTabContent extends StatelessWidget {
  final Future<void> Function() onRefresh;
  const WishlistTabContent({
    super.key,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModel, ProfileState>(
      buildWhen: (previous, current) {
        return current is WishListLoadingState ||
            current is WishListErrorState ||
            current is WishListSuccessState;
      },
      builder: (context, state) {
        if (state is WishListLoadingState ||
            state is ProfileInfoLoadingState ||
            state is HistoryLoadingState) {
          return const LoadingWidget();
        }

        if (state is WishListErrorState) {
          return AppErrorWidget(
            error: state.error,
            serverError: state.serverError,
          );
        }

        if (context.read<ProfileViewModel>().wishlistMovies.isEmpty) {
          return Image.asset(
            AssetsManager.empty1,
          );
        }
        return RefreshIndicator(
          backgroundColor: ColorsManager.mainGrey,
          displacement: 8,
          color: ColorsManager.yellow,
          onRefresh: () => onRefresh(),
          child: MoviesDefaultGrid(
            movies: context.watch<ProfileViewModel>().wishlistMovies,
            crossAxisCount: 3,
            ratePadding: 10,
          ),
        );
      },
    );
  }
}
