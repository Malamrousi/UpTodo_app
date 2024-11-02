import 'package:flutter/material.dart';
//core
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widget/app_text_form_filed.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTextFormFiled(
            keyboardType: TextInputType.text,
            validator: (value) {},
            inputTextType: '',
            hintText: 'Tittle',
            fillColor: Colors.transparent,
            hintStyle: AppStyles.font16WhiteOpacity44Regular,
            autoFocus: true,
            enabledBorder: InputBorder.none),
        InputTextFormFiled(
            keyboardType: TextInputType.text,
            validator: (value) {},
            inputTextType: '',
            hintText: 'Description',
            fillColor: Colors.transparent,
            hintStyle: AppStyles.font16WhiteOpacity44Regular,
            enabledBorder: InputBorder.none),
      ],
    );
  }
}
