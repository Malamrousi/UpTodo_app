import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/feature/category/ui/cubit/category/category_cubit.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';

class CategoryBlocListener extends StatelessWidget {
  const CategoryBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCubit, CategoryState>(
      listenWhen: (previous, current) =>
          current is CategoryLoading ||
          current is CategorySuccess ||
          current is CategoryFailure,
      listener: (context, state) {
        if (state is CategoryLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CategorySuccess) {
          context.pop();
          context.pop();
        } else if (state is CategoryFailure) {
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
