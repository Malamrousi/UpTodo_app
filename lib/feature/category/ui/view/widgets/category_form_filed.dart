import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/app_text_form_filed.dart';
import '../../cubit/add_category/add_category_cubit.dart';

class CategoryFormFiled extends StatelessWidget {
  const CategoryFormFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AddCategoryCubit>().formKey,
      child: InputTextFormFiled(
        controller: context.read<AddCategoryCubit>().categoryNameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter category name';
          }
          return null;
        },
        inputTextType: 'Category name :',
        hintText: 'Category name',
      ),
    );
  }
}
