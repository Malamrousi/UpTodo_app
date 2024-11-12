import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uptodo/feature/calendar/ui/cubit/calender/calender_cubit.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';

class CalendarDateTimeList extends StatelessWidget {
  const CalendarDateTimeList(
      {super.key,
      required this.scrollController,
      required this.dates,
      required this.selectedDate,
      required this.onDateSelected, 

      });
  final List<DateTime> dates;
  final ScrollController scrollController;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: dates.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          DateTime date = dates[index];

          bool isSelected = DateUtils.isSameDay(date, selectedDate);

          bool isEdgeDay = date.weekday == DateTime.saturday ||
              date.weekday == DateTime.friday;

          return GestureDetector(
            onTap: () {
              onDateSelected(date);
              context.read<CalenderCubit>().getTaskByDate(date: date);
            },
            child: Container(
              width: 45,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color:
                    isSelected ? ColorsManger.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
              ),
              child: GestureDetector(
                // onTap: onTap,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateFormat('EEE').format(date).toUpperCase(),
                        style: AppStyles.font12WhiteColorRegular.copyWith(
                          color: isSelected
                              ? ColorsManger.whiteColor
                              : (isEdgeDay
                                  ? const Color(0xFFFF4949)
                                  : ColorsManger.whiteColorOpacity66),
                        ),
                      ),
                      verticalSpacing(4),
                      Text(
                        date.day.toString(),
                        style: AppStyles.font12WhiteColorRegular.copyWith(
                          color: isSelected
                              ? ColorsManger.whiteColor
                              : (isEdgeDay
                                  ? const Color(0xFFFF4949)
                                  : ColorsManger.whiteColorOpacity66),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
