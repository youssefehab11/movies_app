import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/data/api_manager/api_manager.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/data/data_source_impl/movies_data_source_impl.dart';
import 'package:movies_app/data/repositry_impl/movies_repo_impl.dart';
import 'package:movies_app/domain/use_cases/get_movies_use_case.dart';
import 'package:movies_app/presentation/ui/layout/tabs/explore/view/explore.dart';
import 'package:movies_app/presentation/ui/layout/tabs/home/view/home.dart';
import 'package:movies_app/presentation/ui/layout/tabs/profile/view/profile.dart';
import 'package:movies_app/presentation/ui/layout/tabs/search/view/search.dart';
import 'package:movies_app/presentation/ui/layout/view_model/movies_view_model.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  late MoviesViewModel viewModel;

  List<Widget> tabs = [
    const Home(),
    const Search(),
    const Explore(),
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
    viewModel = MoviesViewModel(
      getMoviesUseCase: GetMoviesUseCase(
        moviesRepo: MoviesRepoImpl(
          moviesDataSource: MoviesDataSourceImpl(
            apiManager: ApiManager(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(Object context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        extendBody: true,
        body: tabs[currentIndex],
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: REdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              showSelectedLabels: false,
              elevation: 0,
              currentIndex: currentIndex,
              onTap: (index) => changeSelectedIndex(index),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.homeIc,
                    colorFilter: getIconColor(0),
                    width: getIconWidth(0),
                    height: getIconWidth(0),
                  ),
                  label: 'Home',
                  backgroundColor: ColorsManager.grey,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.searchIc,
                    colorFilter: getIconColor(1),
                    width: getIconWidth(1),
                    height: getIconWidth(1),
                  ),
                  label: 'Search',
                  backgroundColor: ColorsManager.grey,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.exploreIc,
                    colorFilter: getIconColor(2),
                    width: getIconWidth(2),
                    height: getIconWidth(2),
                  ),
                  label: 'Explore',
                  backgroundColor: ColorsManager.grey,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.profileIc,
                    colorFilter: getIconColor(3),
                    width: getIconWidth(3),
                    height: getIconWidth(3),
                  ),
                  label: 'Profile',
                  backgroundColor: ColorsManager.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ColorFilter? getIconColor(int index) {
    return index == currentIndex
        ? const ColorFilter.mode(
            ColorsManager.yellow,
            BlendMode.srcIn,
          )
        : null;
  }

  double getIconHeight(int index) {
    return index == currentIndex ? 24.h : 20.h;
  }

  double getIconWidth(int index) {
    return index == currentIndex ? 24.w : 20.w;
  }

  void changeSelectedIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
