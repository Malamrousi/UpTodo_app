import 'package:flutter/material.dart';
import 'package:uptodo/core/di/dependency_injection.dart';
import 'package:uptodo/feature/category/ui/cubit/add_category/add_category_cubit.dart';
import 'package:uptodo/feature/category/ui/view/category_screen.dart';
import 'package:uptodo/feature/home/ui/cubit/update_task/update_task_cubit.dart';

import 'package:uptodo/feature/register/ui/cubit/register_cubit/register_cubit.dart';
import 'package:uptodo/feature/register/ui/view/register_screen.dart';

import '../../feature/home/data/model/task_model.dart';
import '../../feature/home/ui/view/screen/index_screen.dart';
import '../../feature/home/ui/view/screen/task_screen.dart';
import '../../feature/login/ui/cubit/login_cubit/login_cubit.dart';
import '../../feature/login/ui/view/login_screen.dart';
import '../../feature/on_boading/ui/on_boarding_screen.dart';
import '../../feature/start_screen/ui/start_screen.dart';
import 'routes.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Route for OnBoarding Screen
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      //Route for Start Screen
      case Routes.startScreen:
        return MaterialPageRoute(
          builder: (_) => const StartScreen(),
        );
      //Route for Login Screen
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt.get<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      //Route for Register Screen
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt.get<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
//Route for Home Screen
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
//Route for Category Screen
      case Routes.categoryScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt.get<AddCategoryCubit>(),
            child: const CategoryScreen(),
          ),
        );
//Route for Task Screen
      case Routes.taskScreen:
        final task = settings.arguments as TaskModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt.get<UpdateTaskCubit>(),
            child: TaskScreen(
              taskModel: task,
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Text('No Routes defied to ${settings.name}'),
          ),
        );
    }
  }
}
