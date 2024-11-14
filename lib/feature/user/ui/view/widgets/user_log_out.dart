//MATERIAL
import 'package:flutter/material.dart';
// Spacing
import '../../../../../core/helper/spacing.dart';
//AppStyles
import '../../../../../core/theming/app_styles.dart';

class UserLogOut extends StatelessWidget {
  const UserLogOut({super.key, required this.onTap});
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          const Icon(
            Icons.logout_rounded,
            color: Colors.red,
          ),
          horizontalSpacing(10),
          Text(
            'Log out',
            style: AppStyles.font16RedColorRegular,
          ),
        ],
      ),
    );
    
  }
}
