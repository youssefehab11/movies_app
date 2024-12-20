import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/core/components/error_widget.dart';
import 'package:movies_app/presentation/core/components/loading_widget.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';
import 'package:movies_app/presentation/ui/layout/tabs/search/view_model/search_state.dart';
import 'package:movies_app/presentation/ui/layout/tabs/search/view_model/search_view_model.dart';
import 'package:movies_app/presentation/ui/layout/tabs/search/widgets/card_movie_item.dart';

class SearchContent extends StatelessWidget {
  final List<Movie> movies;
  final ScrollController scrollController;
  const SearchContent({
    super.key,
    required this.movies,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchViewModel, SearchState>(
      builder: (context, state) {
        switch (state) {
          case SearchInitialState():
            return Image.asset(AssetsManager.empty1);
          case SearchLoadingState():
            return const LoadingWidget();
          case SearchErrorState():
            return AppErrorWidget(
              error: state.error,
              serverError: state.serverError,
            );
          case SearchSuccessState():
            if (state.movies.isEmpty) {
              return Center(
                child: Text(
                  StringsManager.noMoviesFound,
                  style: DarkStyles.robotW400F18,
                ),
              );
            }
            return ListView.separated(
              controller: scrollController,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return CardMovieItem(movie: movies[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8.h,
                );
              },
              itemCount: movies.length,
            );
        }
      },
    );
  }
}
