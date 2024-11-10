import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/helper/extension.dart';

import '../../../../../core/assets/assets.dart';

class TaskScreenAppBar extends StatelessWidget {
  const TaskScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => context.pop(),
        icon: SvgPicture.asset(ImageAssets.svgOut));
  }
}
