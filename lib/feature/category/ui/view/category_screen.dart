import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/feature/category/data/model/category_model.dart';
import 'package:uptodo/feature/category/ui/cubit/add_category/add_category_cubit.dart';
import 'package:uptodo/feature/category/ui/view/widgets/category_bloc_listener.dart';
import 'package:uptodo/feature/category/ui/view/widgets/custom_category_button.dart';

import '../../../../core/theming/app_styles.dart';

import 'widgets/category_form_filed.dart';
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
                const CategoryFormFiled(),
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
                CustomCategoryButtons(
                  onPressed: () {
                    addCategory(addCategoryModel());
                  },
                ),
                const CategoryBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addCategory(CategoryModel categoryModel) {
    if (context.read<AddCategoryCubit>().formKey.currentState!.validate()) {
      context.read<AddCategoryCubit>().addCategory(categoryModel);
    }
  }

  CategoryModel addCategoryModel() {
    return CategoryModel(
      name: context.read<AddCategoryCubit>().categoryNameController.text,
      icon: categoryIcon!.codePoint.toString(),
      color: categoryColor!.value.toString(),
    );
  }
}
