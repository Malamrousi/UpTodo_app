import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/helper/extension.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/app_text_button.dart';
import '../../../../../core/widget/app_text_form_filed.dart';
import '../../../data/model/task_model.dart';
import '../../cubit/task/task_cubit.dart';

class TaskScreenShowDialogTextAndDes extends StatefulWidget {
  const TaskScreenShowDialogTextAndDes({super.key, required this.taskModel});
    final TaskModel taskModel;
  @override
  State<TaskScreenShowDialogTextAndDes> createState() => _TaskScreenShowDialogTextAndDesState();
}

class _TaskScreenShowDialogTextAndDesState extends State<TaskScreenShowDialogTextAndDes> {

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<TaskCubit>().titleController.text = widget.taskModel.title;
    context.read<TaskCubit>().descriptionController.text = widget.taskModel.description; 
  }
 @override

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.42.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            color: ColorsManger.darkGray,
            child: Padding(
              padding: const EdgeInsets.only(top: 10 , right: 10 , left: 10 ),
              child: Column(
                children: [
                  Text(
                    'Edit Task title',
                    style: AppStyles.font16WhiteRegular,
                  ),
                  verticalSpacing(10),
                  Divider(color: ColorsManger.grayColor, thickness: .6.w),
                  InputTextFormFiled(
                      controller: context.read<TaskCubit>().titleController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter tittle';
                        }
                      },
                      inputTextType: '',
                      hintText: 'Tittle',
                      fillColor: Colors.transparent,
                      hintStyle: AppStyles.font16WhiteOpacity44Regular,
                      autoFocus: true,
                      enabledBorder: InputBorder.none),
                  InputTextFormFiled(
                      controller:
                          context.read<TaskCubit>().descriptionController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                      },
                      inputTextType: '',
                      hintText: 'Description',
                      fillColor: Colors.transparent,
                      hintStyle: AppStyles.font16WhiteOpacity44Regular,
                      enabledBorder: InputBorder.none),
                  verticalSpacing(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppTextButton(
                        textStyle: AppStyles.font16WPrimaryColorRegular,
                        borderColor: Colors.transparent,
                        bottomWidth: MediaQuery.sizeOf(context).width * .3,
                        bottomHeight: 48,
                        onPressed: () {
                          context.pop();
                        },
                        buttonText: 'Cancel',
                      ),
                      AppTextButton(
                        textStyle: AppStyles.font16WhiteRegular,
                        bottomWidth: MediaQuery.sizeOf(context).width * .4,
                        bottomHeight: 48,
                        onPressed: () {
                          context.pop();
                        },
                        buttonText: 'Edit',
                        backgroundColor: ColorsManger.primaryColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
