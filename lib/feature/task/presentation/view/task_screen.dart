import 'package:flutter/material.dart';

import '../../../home/data/model/task_model.dart';

import 'widgets/task_screen_body.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TaskScreenBody(
        taskModel: taskModel,
      ),
    );
  }
}
