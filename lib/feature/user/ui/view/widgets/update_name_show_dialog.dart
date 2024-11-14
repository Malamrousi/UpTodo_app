import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helper/extension.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/app_text_button.dart';
import '../../../../../core/widget/app_text_form_filed.dart';
import '../../../data/model/user_model.dart';
import '../../cubit/cubit/user_cubit.dart';

class UpdateNameDialog extends StatefulWidget {
  const UpdateNameDialog({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  State<UpdateNameDialog> createState() => _UpdateNameDialogState();
}

class _UpdateNameDialogState extends State<UpdateNameDialog> {
  late TextEditingController _nameController;
  bool isLoading = false;
 @override
  void initState() {    super.initState();
    _nameController = TextEditingController(text: widget.userModel.displayName);
  }
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is NameUpdateSuccess) {
          Navigator.pop(context);
        } else if (state is UserFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: ColorsManger.darkGray,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Change account name',
                        style: AppStyles.font16WhiteRegular,
                      ),
                    ),
                    verticalSpacing(24),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorsManger.darkGray,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: InputTextFormFiled(
                        autoFocus: true,
                        controller: _nameController,
                      
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        inputTextType: '',
                        hintText: 'Name',
                        fillColor: Colors.transparent,
                        hintStyle: AppStyles.font16WhiteOpacity44Regular,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                    verticalSpacing(24),
                    BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextButton(
                              textStyle: AppStyles.font16WPrimaryColorRegular,
                              borderColor: Colors.transparent,
                              bottomWidth: MediaQuery.sizeOf(context).width * .3,
                              bottomHeight: 48,
                              onPressed: state is UserLoading 
                                  ? null 
                                  : () => Navigator.pop(context),
                              buttonText: 'Cancel',
                            ),
                            AppTextButton(
                              textStyle: AppStyles.font16WhiteRegular,
                              bottomWidth: MediaQuery.sizeOf(context).width * .4,
                              bottomHeight: 48,
                              onPressed: state is UserLoading
                                  ? null
                                  : () {
                                      final name = _nameController.text.trim();
                                      if (name.isNotEmpty) {
                                        context
                                            .read<UserCubit>()
                                            .updateUserName(widget.userModel, name);
                                         context.pop();   
                                      }
                                    },
                              buttonText: state is UserLoading ? 'Updating...' : 'Edit',
                              backgroundColor: ColorsManger.primaryColor,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}