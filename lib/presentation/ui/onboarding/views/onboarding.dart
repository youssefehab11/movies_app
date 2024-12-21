import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/application/app_view_model.dart';
import 'package:movies_app/presentation/core/components/gradient_bg.dart';
import 'package:movies_app/presentation/core/router/routes.dart';
import 'package:movies_app/presentation/core/utils/assets_manager.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';
import 'package:movies_app/presentation/ui/onboarding/model/onboard.dart';
import 'package:movies_app/presentation/ui/onboarding/widgets/content.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController controller;

  List<Onboard> onboardItems = [
    Onboard(
      image: AssetsManager.onboarding1,
      title: StringsManager.onboardingTitle1,
      description: StringsManager.onboardingDescription1,
      gradiantBg: [
        const Color(0xFF084250).withOpacity(0),
        const Color(0xFF084250).withOpacity(1),
      ],
    ),
    Onboard(
      image: AssetsManager.onboarding2,
      title: StringsManager.onboardingTitle2,
      description: StringsManager.onboardingDescription2,
      gradiantBg: [
        const Color(0xFF85210E).withOpacity(0),
        const Color(0xFF85210E).withOpacity(1)
      ],
    ),
    Onboard(
      image: AssetsManager.onboarding3,
      title: StringsManager.onboardingTitle3,
      description: StringsManager.onboardingDescription3,
      gradiantBg: [
        const Color(0xFF4C2471).withOpacity(0),
        const Color(0xFF4C2471).withOpacity(1),
      ],
    ),
    Onboard(
      image: AssetsManager.onboarding4,
      title: StringsManager.onboardingTitle4,
      description: StringsManager.onboardingDescription4,
      gradiantBg: [
        const Color(0xFF601321).withOpacity(0),
        const Color(0xFF601321).withOpacity(1),
      ],
    ),
    Onboard(
      image: AssetsManager.onboarding5,
      title: StringsManager.onboardingTitle5,
      gradiantBg: [
        const Color(0xFF2A2C30).withOpacity(0),
        const Color(0xFF2A2C30).withOpacity(1),
      ],
    ),
  ];
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.transparent,
      body: PageView.builder(
        controller: controller,
        itemCount: onboardItems.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(onboardItems[index].image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GradientBg(
                colors: onboardItems[index].gradiantBg!,
                height: double.infinity,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    ),
                    color: ColorsManager.mainDark,
                  ),
                  child: SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Content(
                        title: onboardItems[index].title,
                        description: onboardItems[index].description,
                        forwardBtnTitle: index != onboardItems.length - 1
                            ? StringsManager.next
                            : StringsManager.finish,
                        forwardBtnAction: () => onForwardButtonPressed(index),
                        backBtnTitle: index != 0 ? StringsManager.back : null,
                        backBtnAction:
                            index != 0 ? () => onBackButtonPressed() : null,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void onForwardButtonPressed(int index) async {
    if (index == onboardItems.length - 1) {
      context
          .read<AppViewModel>()
          .saveOnboardingToSharedPref('isOnboarding', false);
      Navigator.pushReplacementNamed(
        context,
        Routes.login,
      );
    }
    await controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onBackButtonPressed() async {
    await controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
