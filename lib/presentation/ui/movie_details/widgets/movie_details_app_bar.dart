import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/presentation/core/utils/app_dialogs.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/helper_functions.dart';
import 'package:movies_app/presentation/ui/movie_details/view_models/movie_details_state.dart';
import 'package:movies_app/presentation/ui/movie_details/view_models/movie_details_view_model_cubit.dart';

class MovieDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MovieDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.transparent,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: REdgeInsetsDirectional.only(end: 20.0),
          child: BlocConsumer<MovieDetailsViewModel, MovieDetailsStates>(
            listener: (context, state) => buildListener(context, state),
            builder: (context, state) {
              MovieDetailsViewModel viewModel = BlocProvider.of(context);
              if (viewModel.movie != null) {
                return GestureDetector(
                  onTap: () => onBookmarkPressed(context, viewModel),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: viewModel.isInWishList
                        ? SvgPicture.asset(
                            key: ValueKey<bool>(viewModel.isInWishList),
                            AssetsManager.bookmarkIc,
                            height: 25.h,
                            colorFilter: const ColorFilter.mode(
                              ColorsManager.yellow,
                              BlendMode.srcIn,
                            ),
                          )
                        : SvgPicture.asset(
                            key: ValueKey<bool>(viewModel.isInWishList),
                            AssetsManager.bookmarkIc,
                            height: 25.h,
                            colorFilter: const ColorFilter.mode(
                              ColorsManager.white,
                              BlendMode.srcIn,
                            ),
                          ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }

  void onBookmarkPressed(
    BuildContext context,
    MovieDetailsViewModel viewModel,
  ) {
    if (viewModel.isInWishList) {
      context
          .read<MovieDetailsViewModel>()
          .removeFromWishList(viewModel.movie!);
    } else {
      context
          .read<MovieDetailsViewModel>()
          .addMovieToWishList(viewModel.movie!);
    }
  }

  void buildListener(BuildContext context, MovieDetailsStates state) async {
    if (state is AddWishListSuccessState) {
      AppDialogs.hideLoading(context);
      Fluttertoast.showToast(
        msg: state.message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorsManager.mainGrey.withOpacity(1),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    if (state is AddWishListErrorState) {
      AppDialogs.hideLoading(context);
      Fluttertoast.showToast(
        msg: extractErrorMessage(state.serverError, state.error),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorsManager.mainGrey.withOpacity(1),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    if (state is RemoveWishListSuccessState) {
      AppDialogs.hideLoading(context);
      Fluttertoast.showToast(
        msg: state.message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorsManager.mainGrey.withOpacity(1),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    if (state is RemoveWishListErrorState) {
      AppDialogs.hideLoading(context);
      Fluttertoast.showToast(
        msg: extractErrorMessage(state.serverError, state.error),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorsManager.mainGrey.withOpacity(1),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    if (state is AddWishListLoadingState ||
        state is RemoveWishListLoadingState) {
      AppDialogs.showLoadingDialog(context);
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
