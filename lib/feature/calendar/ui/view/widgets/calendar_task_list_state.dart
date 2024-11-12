import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/feature/calendar/ui/cubit/calender/calender_cubit.dart';
import 'package:uptodo/feature/calendar/ui/view/widgets/calendar_task_list_widget.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/loading_widget .dart';

class CalendarTaskList extends StatefulWidget {
  const CalendarTaskList({super.key, required this.date});

  final DateTime date;

  @override
  State<CalendarTaskList> createState() => _CalendarTaskListState();
}

class _CalendarTaskListState extends State<CalendarTaskList> {
  TimeOfDay endTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    context.read<CalenderCubit>().getTaskByDate(date: widget.date);
  
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalenderCubit, CalenderState>(builder: (context, state) {
      if (state is CalenderFailure) {
        return Center(
            child: Text(
          state.errorMessage,
          style: AppStyles.font16WhiteRegular,
        ));
      } else if (state is CalenderSuccess) {
        return CalendarTaskListWidget(
          date: widget.date,
        );
      } else {
        return const Center(
          child: LoadingWidget(),
        );
      }
    });
  }

  Widget showCategoryIcon(String icon, {Color? color}) {
    if (icon.startsWith('assets')) {
      return SvgPicture.asset(
        icon,
        width: 14,
        height: 14,
      );
    } else {
      return Icon(
          color: color ?? ColorsManger.whiteColor,
          size: 21,
          IconData(
            int.parse(icon),
            fontFamily: 'MaterialIcons',
          ));
    }
  }
}
