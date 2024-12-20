import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/core/components/movie_cover.dart';
import 'package:movies_app/presentation/core/router/routes.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/extensions.dart';
import 'package:movies_app/presentation/core/utils/styles_manager.dart';
import 'package:movies_app/presentation/core/components/custom_chip.dart';

class CardMovieItem extends StatelessWidget {
  final Movie movie;
  const CardMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.movieDetails,
        arguments: movie.id,
      ),
      child: Card(
        color: ColorsManager.mainGrey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieCover(
                movie: movie,
                height: 200,
                width: 150,
                ratePadding: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: DarkStyles.interW700F20.copyWith(
                          color: ColorsManager.yellow,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie.overview ?? '',
                        style: DarkStyles.robotW400F18,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          CustomChip(
                            title: movie.voteCount?.formatnumOfLikes ?? '',
                            labelStyle: DarkStyles.interW700F18,
                            iconPath: AssetsManager.loveIc,
                          ),
                          const SizedBox(width: 8),
                          CustomChip(
                            title: movie.voteAverage?.formatedRate ?? '',
                            labelStyle: DarkStyles.interW700F18,
                            iconPath: AssetsManager.starIc,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
