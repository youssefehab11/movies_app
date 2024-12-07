import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/components/app_button.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/styles_manager.dart';

class UserActions extends StatelessWidget {
  const UserActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: AppButton(
              onBtnPressed: () {},
              hasSuffixIcon: true,
              btnLabel: 'Edit Profile',
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            flex: 1,
            child: AppButton(
                onBtnPressed: () {},
                btnLabel: 'Exit',
                labelStyle: DarkStyles.robotW400F16.copyWith(
                  color: ColorsManager.white,
                ),
                color: ColorsManager.red,
                hasSuffixIcon: true,
                suffixWidget: SvgPicture.asset(AssetsManager.logoutIc)),
          ),
        ],
      ),
    );
  }
}
