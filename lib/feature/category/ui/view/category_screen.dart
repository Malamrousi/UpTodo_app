import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/core/widget/app_text_form_filed.dart';
import 'package:uptodo/feature/category/data/model/category_model.dart';
import 'package:uptodo/feature/category/ui/cubit/category/category_cubit.dart';

import '../../../../core/theming/app_styles.dart';

import '../../../../core/theming/colors_manger.dart';
import '../../../../core/widget/app_text_button.dart';
import 'widgets/custom_category_icon_color_picker.dart';
import 'widgets/icon_picker_button.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  IconData? categoryIcon;
  Color? categoryColor;

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
                Form(
                  key: context.read<CategoryCubit>().formKey,
                  child: InputTextFormFiled(
                    controller:
                        context.read<CategoryCubit>().categoryNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter category name';
                      }
                      return null;
                    },
                    inputTextType: 'Category name :',
                    hintText: 'Category name',
                  ),
                ),
                verticalSpacing(20),
                Text(
                  'Category icon :',
                  style: AppStyles.font16WhiteRegular,
                ),
                verticalSpacing(16),
                 IconPickerButton(
                  onIconSelected: (icon) {
                    setState(() {
                      categoryIcon = icon;
                    });
                  },
                ),
                verticalSpacing(16),
                Text(
                  'Category color :',
                  style: AppStyles.font16WhiteRegular,
                ),
                verticalSpacing(16),
                CustomCategoryIconColorPicker(onColorSelected: (color) {
                  setState(() {
                    categoryColor = color;
                  });
                }),
                verticalSpacing(MediaQuery.sizeOf(context).height * .4),
                Row(
                  children: [
                    AppTextButton(
                      textStyle: AppStyles.font16WPrimaryColorRegular,
                      borderColor: Colors.transparent,
                      bottomWidth: MediaQuery.sizeOf(context).width * .35,
                      bottomHeight: 48,
                      onPressed: () {
                        context.pop();
                      },
                      buttonText: 'Cancel',
                    ),
                    horizontalSpacing(20),
                    AppTextButton(
                      textStyle: AppStyles.font16WhiteRegular,
                      bottomWidth: MediaQuery.sizeOf(context).width * .4,
                      bottomHeight: 48,
                      onPressed: () {
                        final CategoryModel categoryModel = CategoryModel(
                          name: context
                              .read<CategoryCubit>()
                              .categoryNameController
                              .text,
                          icon: categoryIcon!.codePoint.toString(),
                          color: categoryColor!.value.toString(),
                        );

                        addCategory(categoryModel);

                        context.pop();
                      },
                      buttonText: 'Create Category',
                      backgroundColor: ColorsManger.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addCategory(CategoryModel categoryModel) {
    if (context.read<CategoryCubit>().formKey.currentState!.validate()) {
      context.read<CategoryCubit>().addCategory(categoryModel);
    }
  }
}
