import 'package:flutter/material.dart';
import 'package:uptodo/core/theming/colors_manger.dart';

import 'calendar_date_and_year_and_action_button.dart';
import 'calendar_date_time_list.dart';

class CalendarStrip extends StatefulWidget {
  const CalendarStrip(
      {super.key, required this.selectedDate, required this.onDateSelected});

  final DateTime selectedDate;

  final Function(DateTime) onDateSelected;

  @override
  State<CalendarStrip> createState() => _CalendarStripState();
}

class _CalendarStripState extends State<CalendarStrip> {
  late ScrollController _scrollController;
  late List<DateTime> _dates;
  int numberOfDates = 360;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _dates = _getDateList();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      int selectedIndex = _dates.indexOf(widget.selectedDate);
      if (selectedIndex != -1) {
        _scrollController.animateTo(
          selectedIndex * 53.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  List<DateTime> _getDateList() {
    DateTime currentDate = DateTime.now();
    while (currentDate.weekday != DateTime.saturday) {
      currentDate = currentDate.subtract(const Duration(days: 1));
    }

    List<DateTime> dates = [];
    for (int i = 0; i < numberOfDates; i++) {
      dates.add(currentDate.add(Duration(days: i)));
    }
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: ColorsManger.darkGray,
      child: Column(
        children: [
         CalendarDateAndYearAndActionButton(
          scrollController: _scrollController,
          selectedDate: widget.selectedDate,
         ),
          CalendarDateTimeList(
            scrollController: _scrollController,
            dates: _dates,
            selectedDate: widget.selectedDate,
            onDateSelected: widget.onDateSelected,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
