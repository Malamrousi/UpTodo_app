import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/assets/assets.dart';
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/feature/user/data/model/user_model.dart';
import 'package:uptodo/feature/user/presentation/cubit/cubit/user_cubit.dart';
import '../../../../../core/theming/app_styles.dart';

class UserImageAndName extends StatefulWidget {
  const UserImageAndName({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<UserImageAndName> createState() => _UserImageAndNameState();
}

class _UserImageAndNameState extends State<UserImageAndName> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getCurrentUser(widget.userModel);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Profile",
            style: AppStyles.font20WhiteColorBold,
          ),
        ),
        verticalSpacing(20),
        SizedBox(
          height: 120.h,
          width: 100.w,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                ImageAssets.imagesUserImageFirst,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        verticalSpacing(10),
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return Text(
                state.userModel.displayName ?? 'Name',
                style: AppStyles.font20WhiteColorRegular,
              );
            } else if (state is UserFailure) {
              return Text(
                state.errorMessage,
                style: AppStyles.font14WhiteColorRegular,
              );
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
