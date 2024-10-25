import 'package:flutter/material.dart';

import 'build_page.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
                  child: PageView(
                    controller: controller,
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
                );
  }
}