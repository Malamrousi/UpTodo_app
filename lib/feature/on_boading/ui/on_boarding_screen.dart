//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//core
import 'package:uptodo/core/theming/app_styles.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/core/routing/routes.dart';

//widgets
import '../../../core/theming/colors_manger.dart';
import 'widgets/smooth_page_indicator.dart';
import 'package:uptodo/feature/on_boading/ui/widgets/custom_button.dart';
import 'package:uptodo/feature/on_boading/ui/widgets/custom_page_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            padding: REdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomButton(
                    onPressed: () {
                      context.pushNamed(Routes.startScreen);
                    },
                    text: 'skip',
                    textStyle: AppStyles.font16WhiteOpacity44Regular,
                  ),
                ),
                CustomPageView(controller: pageController),
              Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          onPressed: () {
            pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate);
          },
          text: 'Back',
          textStyle: AppStyles.font16WhiteOpacity44Regular,
        ),
        CustomButton(
          onPressed: () {
            if (currentPage < 2) {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.decelerate);
            } else {
              context.pushNamed(Routes.startScreen);
            }
          },
          text: currentPage == 2 ? 'Get Started' : 'Next',
          textStyle: AppStyles.font16WhiteRegular,
          backgroundColor: ColorsManger.purpleColor,
        ),
      ],
    
             ) ],
            ),
          ),
          CustomSmoothPageIndicator(
            controller: pageController,
          )
        ]),
      ),
    );
  }
}
