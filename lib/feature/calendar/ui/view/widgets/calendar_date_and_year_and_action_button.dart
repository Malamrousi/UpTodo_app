import 'package:flutter/material.dart';

import 'calender_strip_month_and_year.dart';

class CalendarDateAndYearAndActionButton extends StatelessWidget {
  const CalendarDateAndYearAndActionButton(
      {super.key, required this.scrollController, required this.selectedDate});

  final ScrollController scrollController;

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              scrollController.animateTo(
                scrollController.offset - (53.0 * 7),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
            icon: const Icon(Icons.chevron_left, color: Colors.white),
          ),
          CalenderStripMonthAndYear(
            selectedDate: selectedDate,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right, color: Colors.white),
            onPressed: () {
              scrollController.animateTo(
                scrollController.offset + (53.0 * 7),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
