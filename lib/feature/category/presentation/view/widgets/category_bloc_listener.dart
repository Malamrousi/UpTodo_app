import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/feature/category/presentation/cubit/add_category/add_category_cubit.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';

class CategoryBlocListener extends StatelessWidget {
  const CategoryBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCategoryCubit, AddCategoryState>(
      listenWhen: (previous, current) =>
          current is AddCategoryLoading ||
          current is AddCategorySuccess ||
          current is AddCategoryFailure,
      listener: (context, state) {
        if (state is AddCategoryLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AddCategorySuccess) {
          context.pop();
          context.pop();
        } else if (state is AddCategoryFailure) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorsManger.darkColor,
              content: Text(
                state.errorMessage,
                style: AppStyles.font16WhiteRegular,
              ),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
    
  }
}
