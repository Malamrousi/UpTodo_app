import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/theming/app_styles.dart';

class CalenderStripMonthAndYear extends StatelessWidget {
  const CalenderStripMonthAndYear({super.key, required this.selectedDate});

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            Text(
              DateFormat('MMMM').format(selectedDate).toUpperCase(),
              style: AppStyles.font20WhiteColorBold,
            ),
            Text(
              DateFormat('yyyy').format(selectedDate),
              style: AppStyles.font16WhiteRegular,
            ),
          ],
        ),
      ),
    );
  }
}
