import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';

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
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              AssetsManager.bookmarkIc,
              height: 25.h,
              colorFilter: const ColorFilter.mode(
                ColorsManager.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
