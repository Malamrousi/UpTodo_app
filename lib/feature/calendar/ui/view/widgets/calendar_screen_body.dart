import 'package:flutter/material.dart';
import 'package:uptodo/core/theming/app_styles.dart';

import '../../../../../core/helper/spacing.dart';
import 'calendar_strip.dart';

class CalendarScreenBody extends StatefulWidget {
  const CalendarScreenBody({super.key});

  @override
  State<CalendarScreenBody> createState() => _CalendarScreenBodyState();
}

class _CalendarScreenBodyState extends State<CalendarScreenBody> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          verticalSpacing(20),
          Center(
              child: Text(
            'Calendar',
            style: AppStyles.font20WhiteColorRegular,
          )),
                  verticalSpacing(16),
          CalendarStrip(
            selectedDate: selectedDate,
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          )
        ],
      ),
    );
  }
}
