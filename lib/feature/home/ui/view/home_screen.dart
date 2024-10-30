//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//widgets
import 'package:uptodo/feature/home/ui/view/widgets/custom_app_bar.dart';

import 'widgets/home_screen_no_data_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding:  EdgeInsets.only(right: 24.w , left: 24.w , top: 14.h), 
        child: const Column(
          children: [
            CustomAppBar(),
            
            HomeScreenNoDataState(),
            ],
        ),
      )),
    );
  }
}
