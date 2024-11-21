import 'package:flutter/material.dart';

import '../../../../../core/theming/colors_manger.dart';

FloatingActionButton customFloatingActionButton({void Function()? onPressed}) {
  return FloatingActionButton(
    onPressed: onPressed,
    elevation: 1,
    tooltip: 'Add Task',
    backgroundColor: ColorsManger.primaryColor,
    shape: const CircleBorder(),
    child: const Icon(
      Icons.add,
      color: ColorsManger.whiteColor,
    ),
  );
}