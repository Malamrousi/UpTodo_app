import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/feature/home/ui/cubit/task/task_cubit.dart';
//core
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widget/app_text_form_filed.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<TaskCubit>().formKey,
      child: Column(
        children: [
          InputTextFormFiled(
            controller: context.read<TaskCubit>().titleController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if(value == null || value.isEmpty){
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
                   controller: context.read<TaskCubit>().descriptionController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please enter description';
                }
              },
              inputTextType: '',
              hintText: 'Description',
              fillColor: Colors.transparent,
              hintStyle: AppStyles.font16WhiteOpacity44Regular,
              enabledBorder: InputBorder.none),
        ],
      ),
    );
  }
}
