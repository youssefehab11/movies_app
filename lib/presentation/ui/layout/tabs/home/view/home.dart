import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/components/horizontal_movies_list.dart';
import 'package:movies_app/presentation/core/components/row_title_component.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const List<String> testImages = [
    'assets/images/test_img.png',
    'assets/images/test_img.png',
    'assets/images/test_img.png',
    'assets/images/test_img.png',
    'assets/images/test_img.png'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                'assets/images/test_img.png',
                width: double.infinity,
                height: 645.h,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                height: 645.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorsManager.secondaryGrey.withOpacity(0.8),
                      ColorsManager.secondaryGrey.withOpacity(0.6),
                      ColorsManager.secondaryGrey.withOpacity(1),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Image.asset(AssetsManager.availableNow),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.58,
                        height: 351.h,
                      ),
                      itemCount: testImages.length,
                      itemBuilder: (
                        BuildContext context,
                        int itemIndex,
                        int pageViewIndex,
                      ) {
                        return Image.asset(
                          testImages[itemIndex],
                        );
                      },
                    ),
                    Image.asset(AssetsManager.watchNow),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RowTitleComponent(
                        title: 'New Releases',
                      ),
                    ),
                    const HorizontalMoviesList(),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RowTitleComponent(
                        title: 'Top Rated',
                      ),
                    ),
                    const HorizontalMoviesList(),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
