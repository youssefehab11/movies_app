import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/core/components/app_button.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/constants.dart';
import 'package:movies_app/presentation/core/utils/extensions.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';
import 'package:movies_app/presentation/ui/movie_details/widgets/custom_chip.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({
    super.key,
    required this.movie,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                Container(
                  height: Constants.bgImageHight.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ColorsManager.secondaryGrey.withOpacity(0.2),
                        ColorsManager.secondaryGrey.withOpacity(1),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SafeArea(
                        bottom: false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: ColorsManager.white,
                              ),
                            ),
                            GestureDetector(
                              child: SvgPicture.asset(
                                AssetsManager.bookmarkIc,
                                height: 22.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SvgPicture.asset(
                        AssetsManager.playIc,
                        height: 90.h,
                      ),
                    ),
                    Text(
                      movie.title ?? '',
                      textAlign: TextAlign.center,
                      style: DarkStyles.interW700F24,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            movie.releaseDate?.formatedDate ?? '',
            style:
                DarkStyles.interW700F16.copyWith(color: ColorsManager.greyText),
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            margin: REdgeInsets.symmetric(horizontal: 16.0),
            child: AppButton(
              btnLabel: 'Watch',
              labelStyle: DarkStyles.interW700F20,
              onBtnPressed: () {},
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
                title: movie.voteCount?.formatedInt ?? '',
                labelStyle: DarkStyles.interW700F24,
                iconPath: AssetsManager.loveIc,
              ),
              CustomChip(
                title: '90',
                labelStyle: DarkStyles.interW700F24,
                iconPath: AssetsManager.clockIc,
              ),
              CustomChip(
                title: '${movie.voteAverage?.formatedRate}',
                labelStyle: DarkStyles.interW700F24,
                iconPath: AssetsManager.starIc,
              ),
            ],
          )
        ],
      ),
    );
  }
}
