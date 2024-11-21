import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/di/dependency_injection.dart';
//widgets
import '../cubit/calender/calender_cubit.dart';
import 'widgets/calendar_screen_body.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CalenderCubit>(),
      child: const CalendarScreenBody(),
    );
  }
}
