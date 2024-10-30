import 'package:flutter/material.dart';
import 'package:uptodo/core/di/dependency_injection.dart';

import 'package:uptodo/feature/register/ui/cubit/register_cubit/register_cubit.dart';
import 'package:uptodo/feature/register/ui/view/register_screen.dart';

import '../../feature/home/ui/view/home_screen.dart';
import '../../feature/login/ui/cubit/login_cubit/login_cubit.dart';
import '../../feature/login/ui/view/login_screen.dart';
import '../../feature/on_boading/ui/on_boarding_screen.dart';
import '../../feature/start_screen/ui/start_screen.dart';
import 'routes.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.startScreen:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt.get<LoginCubit>(),
                child: const LoginScreen()));
      case Routes.registerScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt.get<RegisterCubit>(),
                  child: const RegisterScreen(),
                ));

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Text('No Routes defied to ${settings.name}'),
          ),
        );
    }
  }
}
