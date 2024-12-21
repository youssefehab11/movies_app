import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/core/router/routes.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/ui/onboarding/widgets/content.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManager.intro), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: ColorsManager.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            child: Padding(
              padding: REdgeInsets.all(16.0),
              child: Content(
                title: StringsManager.introTitle,
                description: StringsManager.introDescription,
                forwardBtnTitle: StringsManager.exploreNow,
                forwardBtnAction: () {
                  Navigator.pushReplacementNamed(context, Routes.onboarding);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
