import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/core/routing/app_routes.dart';
import 'package:uptodo/core/routing/routes.dart';
import 'package:uptodo/feature/login/ui/cubit/login_cubit/login_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<LoginCubit>().signOut();
              context.pushNamedAndRemoveUntil(Routes.startScreen);
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
            )),
      ),
    );
  }
}
