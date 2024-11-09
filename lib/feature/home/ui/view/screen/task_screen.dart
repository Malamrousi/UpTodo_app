import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../widgets/task_screen_app_bar.dart';
import '../widgets/task_screen_task_time.dart';
import '../widgets/task_screen_tittle_and_des.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
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
              const TaskScreenTittleAndDes() ,
                  verticalSpacing(84),
             const TaskScreenTaskTime(),
            ],
          ),
        ),
      ),
    );
  }
}