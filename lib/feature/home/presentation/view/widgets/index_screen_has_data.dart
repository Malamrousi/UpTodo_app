//packages
import 'package:flutter/material.dart';
//core
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/core/theming/colors_manger.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widget/app_text_form_filed.dart';
//widgets
import 'package:uptodo/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'index_screen_task_completed.dart';
import 'index_screen_task_not_completed_state.dart';

class IndexScreenHasData extends StatelessWidget {
  const IndexScreenHasData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16 , right: 10 , left: 10  ,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          InputTextFormFiled(
            keyboardType: TextInputType.text,
            validator: (value) {},
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search for your task...',
            inputTextType: '',
          ),
        const IndexScreenTaskNotCompletedState(),
          verticalSpacing(20),
          Container(
            width: 102,
            height: 31,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ColorsManger.darkGray),
            child: Center(
              child: Text(
                'Completed',
                style: AppStyles.font16WhiteRegular,
              ),
            ),
          ),
       
     const  IndexScreenTaskCompleted(),
        ],
      ),
    );
  }
}