import 'package:flutter/material.dart';

// ScreenUtil
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Assets
import 'package:uptodo/core/assets/assets.dart';
// Spacing
import 'package:uptodo/core/helper/spacing.dart';
// AppStyles
import '../../../../../core/theming/app_styles.dart';

class UserImageAndName extends StatelessWidget {
  const UserImageAndName({super.key});

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
        Text(
          'Martha Hays',
          style: AppStyles.font20WhiteColorRegular,
        ),
      ],
    );
  }
}
