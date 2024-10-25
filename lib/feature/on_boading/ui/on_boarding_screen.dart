//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/core/routing/routes.dart';
//core
import 'package:uptodo/core/theming/app_styles.dart';
import 'package:uptodo/core/theming/colors_manger.dart';
import 'package:uptodo/feature/on_boading/ui/widgets/custom_button.dart';

import 'widgets/build_page.dart';

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
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: const [
                      BuildPage(
                        image: 'assets/images/on_boarding1.png',
                        title: 'Manage your tasks',
                        subTitle:
                            'You can easily manage all of your daily tasks in DoMe for free',
                      ),
                      BuildPage(
                        image: 'assets/images/on_boarding2.png',
                        title: 'Create daily routine',
                        subTitle:
                            'In Uptodo  you can create your personalized routine to stay productive',
                      ),
                      BuildPage(
                        image: 'assets/images/on_boarding3.png',
                        title: 'Orgonaize your tasks',
                        subTitle:
                            'You can organize your daily tasks by adding your tasks into separate categories',
                      ),
                    ],
                  ),
                ),
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
                )
              ],
            ),
          ),
          Positioned(
            bottom: 350.h,
            left: MediaQuery.sizeOf(context).width * 0.35.w,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: const ScaleEffect(
                  spacing: 8.0,
                  radius: 4.0,
                  dotWidth: 26,
                  dotHeight: 4,
                  paintStyle: PaintingStyle.fill,
                  dotColor: ColorsManger.grayColor,
                  strokeWidth: 1,
                  activeDotColor: ColorsManger.purpleColor),
            ),
          ),
        ]),
      ),
    );
  }
}
