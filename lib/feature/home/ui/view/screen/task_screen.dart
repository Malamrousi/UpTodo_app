import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../widgets/task_screen_app_bar.dart';
import '../widgets/update_task_screen_tittle_and_des.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TaskScreenAppBar(),
              verticalSpacing(30),
              const UpdateTaskScreenTittleAndDes()
            ],
          ),
        ),
      ),
    );
  }
}
