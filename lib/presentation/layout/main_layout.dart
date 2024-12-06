import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/layout/tabs/explore/view/explore.dart';
import 'package:movies_app/presentation/layout/tabs/home/view/home.dart';
import 'package:movies_app/presentation/layout/tabs/profile/view/profile.dart';
import 'package:movies_app/presentation/layout/tabs/search/view/home.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const Home(),
    const Search(),
    const Explore(),
    const Profile(),
  ];
  @override
  Widget build(Object context) {
    return Scaffold(
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
