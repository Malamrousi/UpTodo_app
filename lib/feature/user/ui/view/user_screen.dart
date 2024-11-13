//MATERIAL
import 'package:flutter/material.dart';
//BLOC
import 'package:flutter_bloc/flutter_bloc.dart';
//DI
import 'package:uptodo/core/di/dependency_injection.dart';
//cubit
import '../cubit/cubit/user_cubit.dart';
//UserScreen Body Widget
import 'widgets/user_screen_body.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<UserCubit>(),
      child: const UserScreenBody(),
    );
  }
}
