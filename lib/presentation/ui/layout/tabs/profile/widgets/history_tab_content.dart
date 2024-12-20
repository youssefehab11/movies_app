import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/core/components/error_widget.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/components/movies_grid.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_state.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view_model/profile_view_model.dart';

class HistoryTabContent extends StatelessWidget {
  final Function(BuildContext) onRefresh;
  const HistoryTabContent({
    super.key,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModel, ProfileState>(
      buildWhen: (previous, current) {
        return current is HistoryLoadingState ||
            current is HistoryErrorState ||
            current is HistorySuccessState;
      },
      builder: (context, state) {
        if (state is HistoryLoadingState ||
            state is ProfileInfoLoadingState ||
            state is WishListLoadingState) {
          return const LoadingWidget();
        }

        if (state is HistoryErrorState) {
          return AppErrorWidget(
            error: state.error,
            serverError: state.serverError,
          );
        }
        if (context.read<ProfileViewModel>().historytMovies.isEmpty) {
          return Image.asset(
            AssetsManager.empty1,
          );
        }
        return RefreshIndicator(
          backgroundColor: ColorsManager.mainGrey,
          displacement: 8,
          color: ColorsManager.yellow,
          onRefresh: () => onRefresh(context),
          child: MoviesDefaultGrid(
            movies: context.watch<ProfileViewModel>().historytMovies,
            crossAxisCount: 3,
            ratePadding: 10,
          ),
        );
      },
    );
  }
}
