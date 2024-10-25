//PACKAGES
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//core
import 'package:uptodo/core/routing/app_routes.dart';
import 'package:uptodo/core/routing/routes.dart';
import 'package:uptodo/core/theming/colors_manger.dart';

class UpToDo extends StatelessWidget {
  const UpToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UpToDo',
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Lato',
          scaffoldBackgroundColor: ColorsManger.primaryColor,
        ),
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
