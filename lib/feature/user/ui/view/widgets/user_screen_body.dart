//MATERIAL
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Spacing
import 'package:uptodo/core/helper/spacing.dart';
//NumberFoCompletedAndNotCompleted widget
import '../../../data/model/user_model.dart';
import '../../cubit/cubit/user_cubit.dart';
import 'number_fo_completed_and_not_completed.dart';
//UserImageAndName widget
import 'user_app_setting_and_up_to_do.dart';
//UserImageAndName widget
import 'user_image_and_name.dart';
//UserLogOut Widget
import 'user_log_out.dart';
//UserLogOut Bloc Listener
import 'user_log_out_bloc_listener.dart';

class UserScreenBody extends StatefulWidget {
  const UserScreenBody({super.key});


  @override
  State<UserScreenBody> createState() => _UserScreenBodyState();
}

class _UserScreenBodyState extends State<UserScreenBody> {

  

  final UserModel userModel =UserModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              UserImageAndName(
                userModel:userModel,
              ),
              verticalSpacing(20),
              const NumberFoCompletedAndNotCompleted(),
              verticalSpacing(32),
               UserAppSettingAndUpToDo(
                userModel:userModel,
              ),
              verticalSpacing(20),
              UserLogOut(
                onTap: () {
                  context.read<UserCubit>().logOut();
                },
              ),
              const UserLogOutBlocListener()
            ],
          ),
        ));
  }
}
