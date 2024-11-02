//PACKAGES
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/di/dependency_injection.dart';
//core
import 'package:uptodo/core/routing/app_routes.dart';
import 'package:uptodo/core/routing/routes.dart';
import 'package:uptodo/core/theming/colors_manger.dart';
import 'package:uptodo/feature/category/ui/cubit/category/category_cubit.dart';

class UpToDo extends StatelessWidget {
  const UpToDo({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => getIt.get<CategoryCubit>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UpToDo',
          theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Lato',
            scaffoldBackgroundColor: ColorsManger.darkColor,
          ),
          initialRoute:
              user == null ? Routes.onBoardingScreen : Routes.homeScreen,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
