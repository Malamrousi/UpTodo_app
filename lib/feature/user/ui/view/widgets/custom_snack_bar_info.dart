import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomSnackBarInfo extends StatelessWidget {
  const CustomSnackBarInfo({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.info(
            message:
                "This feature is under development. I will do it after the exams are over. Pray for me 😂",
          ),
        );

      },
      child: child,
    );
  }
}
