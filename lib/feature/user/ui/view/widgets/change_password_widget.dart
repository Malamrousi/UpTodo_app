import 'package:flutter/material.dart';
import 'package:uptodo/feature/user/data/model/user_model.dart';

import 'custom_text_and_icon.dart';
import 'update_name_show_dialog.dart';

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.zero,
                child: Center(
                    child: UpdateNameDialog(
                  userModel: userModel,
                )),
              );
            });
      },
      child: const CustomTextAndIcon(
        icon: Icons.person_2_outlined,
        title: 'Change account name',
      ),
    );
  }
}
