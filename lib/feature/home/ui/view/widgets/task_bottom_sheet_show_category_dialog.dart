import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/core/routing/routes.dart';
import 'package:uptodo/feature/category/data/model/category_model.dart';
import 'package:uptodo/feature/home/ui/cubit/get_category/get_category_cubit.dart';
import 'package:uptodo/feature/home/ui/view/widgets/custom_category_item_index.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/app_text_button.dart';
import '../../../data/model/category_item_model.dart';
import 'category_item_widget.dart';

class TaskBottomSheetShowCategoryDialog extends StatefulWidget {
  const TaskBottomSheetShowCategoryDialog(
      {super.key,  required this.categorySelected});

  final void Function(Map<String, dynamic> category) categorySelected;

  @override
  State<TaskBottomSheetShowCategoryDialog> createState() =>
      _TaskBottomSheetShowCategoryDialogState();
}

class _TaskBottomSheetShowCategoryDialogState
    extends State<TaskBottomSheetShowCategoryDialog> {
  @override
  void initState() {
    super.initState();

    context.read<GetCategoryCubit>().listenToCategoryStream();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.75.h,
        color: ColorsManger.darkGray,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Text(
                'Choose Category',
                style: AppStyles.font20WhiteColorBold,
              ),
              verticalSpacing(10),
              Divider(color: ColorsManger.grayColor, thickness: 0.6.w),
              verticalSpacing(10),
              Expanded(
                child: BlocBuilder<GetCategoryCubit, GetCategoryState>(
                  builder: (context, state) {
                    if (state is GetCategorySuccess) {
                      final allCategories = [
                        ...CustomCategoryItemIndex.items,
                        ...context.read<GetCategoryCubit>().categoryList,
                      ];
                      return SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: allCategories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) {
                            var item = allCategories[index];

                            if (item is CategoryItemModel) {
                              return GestureDetector(
                                onTap: () {
                                  widget.categorySelected({
                                    'name': item.title,
                                    'color': item.color,
                                    'image': item.image
                                  });
                                  context.pop();
                                },
                                child: CategoryItemWidget(
                                  color: item.color,
                                  icon: SvgPicture.asset(item.image),
                                  title: item.title,
                                ),
                              );
                            }

                            if (item is CategoryModel) {
                              return GestureDetector(
                                onTap: () {
                                  widget.categorySelected({
                                    'name': item.name,
                                    'color': item.color,
                                    'icon': item.icon
                                  });
                                  context.pop();
                                },
                                child: CategoryItemWidget(
                                  color: Color(int.parse(item.color)),
                                  icon: Icon(
                                    IconData(
                                      int.parse(item.icon),
                                      fontFamily: 'MaterialIcons',
                                    ),
                                    size: 30.sp,
                                    color: Color(
                                      int.parse(item.color),
                                    ).withOpacity(1),
                                  ),
                                  title: item.name,
                                ),
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      );
                    } else if (state is GetCategoryFailure) {
                      return Text(
                        state.errorMessage,
                        style: AppStyles.font16WhiteRegular,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              verticalSpacing(10),
              AppTextButton(
                onPressed: () {
                  context.pushNamed(Routes.categoryScreen);
                },
                buttonText: 'Add Category',
                backgroundColor: ColorsManger.primaryColor,
                textStyle: AppStyles.font16WhiteRegular,
                bottomWidth: MediaQuery.sizeOf(context).width * 0.7.w,
                bottomHeight: 48.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
