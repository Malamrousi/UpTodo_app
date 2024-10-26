import 'package:flutter/material.dart';

import '../../feature/login/ui/login_screen.dart';
import '../../feature/on_boading/ui/on_boarding_screen.dart';
import '../../feature/start_screen/ui/start_screen.dart';
import 'routes.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.startScreen:
        return MaterialPageRoute(builder: (_) => const StartScreen());
        case Routes.loginScreen:
        return   MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Text('No Routes defied to ${settings.name}'),
          ),
        );
    }
  }
}
