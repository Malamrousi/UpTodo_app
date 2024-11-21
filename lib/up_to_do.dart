import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/di/dependency_injection.dart';
import 'package:uptodo/core/routing/app_routes.dart';
import 'package:uptodo/core/routing/routes.dart';
import 'package:uptodo/core/theming/colors_manger.dart';
import 'package:uptodo/feature/home/presentation/cubit/get_category/get_category_cubit.dart';
import 'package:uptodo/feature/home/presentation/cubit/task/task_cubit.dart';
import 'package:uptodo/feature/user/presentation/cubit/cubit/user_cubit.dart';

class UpToDo extends StatelessWidget {
  const UpToDo({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<TaskCubit>()..getTasksByStatus(),
          ),
          BlocProvider(
            create: (context) => getIt.get<GetCategoryCubit>(),
          ),
           BlocProvider(
            create: (context) => getIt.get<UserCubit>(),
          ),
        ],
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
