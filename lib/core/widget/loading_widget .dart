import 'package:flutter/material.dart';

import '../theming/app_styles.dart';

class LoadingWidget  extends StatelessWidget {
  const LoadingWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            'Loading your tasks...',
            style: AppStyles.font16WhiteRegular,
          ),
        ],
      ),
    );
  }
}