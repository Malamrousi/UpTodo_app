import 'package:flutter/material.dart';
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/core/widget/app_text_form_filed.dart';

import '../../../../core/theming/app_styles.dart';

import 'widgets/icon_picker_button.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  IconData? categoryIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create new category',
                  style: AppStyles.font20WhiteColorBold,
                ),
                verticalSpacing(20),
                InputTextFormFiled(
                  validator: (value) {},
                  inputTextType: 'Category name :',
                  hintText: 'Category name',
                ),
                verticalSpacing(20),
                Text(
                  'Category icon :',
                  style: AppStyles.font16WhiteRegular,
                ),
                verticalSpacing(16),
              const  IconPickerButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
