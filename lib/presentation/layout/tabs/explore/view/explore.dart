import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/components/movie_cover.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/styles_manager.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: SizedBox(
            height: 48.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    curve: Curves.easeInOut,
                    padding: REdgeInsets.all(10.0),
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: ColorsManager.yellow, width: 2),
                      color: index == selectedIndex
                          ? ColorsManager.yellow
                          : ColorsManager.transparent,
                    ),
                    child: Text(
                      'Action',
                      style: LightStyles.interW700F20.copyWith(
                        color: index == selectedIndex
                            ? ColorsManager.black
                            : ColorsManager.yellow,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 5 / 7,
            ),
            itemCount: 20,
            itemBuilder: (context, index) => const MovieCover(),
          ),
        )
      ],
    );
  }
}
