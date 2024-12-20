import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/core/components/app_button.dart';
import 'package:movies_app/presentation/core/components/gradient_bg.dart';
import 'package:movies_app/presentation/core/router/routes.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/constants.dart';
import 'package:movies_app/presentation/core/utils/extensions.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';
import 'package:movies_app/presentation/ui/movie_details/view_models/movie_details_view_model_cubit.dart';
import 'package:movies_app/presentation/ui/movie_details/widgets/custom_chip.dart';
import 'package:movies_app/presentation/ui/movie_details/widgets/poster_content.dart';

class PosterSection extends StatelessWidget {
  final Movie movie;
  const PosterSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Constants.bgImageHight.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.network(
                movie.posterPath ?? '',
                width: double.infinity,
                height: Constants.bgImageHight.h,
                fit: BoxFit.cover,
              ),
              GradientBg(
                colors: [
                  ColorsManager.secondaryGrey.withOpacity(0.2),
                  ColorsManager.secondaryGrey.withOpacity(1),
                ],
              ),
              PosterContent(
                onPlayPressed: watchMovie,
                movieTitle: movie.title ?? '',
                releaseDate: movie.releaseDate?.formatedDate ?? '',
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          margin: REdgeInsets.symmetric(horizontal: 16.0),
          child: AppButton(
            btnLabel: StringsManager.watch,
            labelStyle: DarkStyles.interW700F20,
            onBtnPressed: () => watchMovie(context),
            color: ColorsManager.red,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomChip(
              title: movie.voteCount?.formatnumOfLikes ?? '',
              labelStyle: DarkStyles.interW700F20,
              iconPath: AssetsManager.loveIc,
            ),
            CustomChip(
              title: '${movie.runtime}',
              labelStyle: DarkStyles.interW700F20,
              iconPath: AssetsManager.clockIc,
            ),
            CustomChip(
              title: '${movie.voteAverage?.formatedRate}',
              labelStyle: DarkStyles.interW700F20,
              iconPath: AssetsManager.starIc,
            ),
          ],
        ),
      ],
    );
  }

  void watchMovie(BuildContext context) {
    context.read<MovieDetailsViewModel>().addMovieToHistory(movie);
    Navigator.pushNamed(context, Routes.streamVideo);
  }
}
