import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/app_regx.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/app_text_form_filed.dart';
import '../../cubit/login_cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscureTextIcon = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          InputTextFormFiled(
            controller: context.read<LoginCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            inputTextType: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter valid email';
              }
            },
            hintText: 'Enter your Email',
          ),
          verticalSpacing(15),
          InputTextFormFiled(
            controller: context.read<LoginCubit>().passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscureTextIcon,
            inputTextType: 'Password',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter valid Password';
              }
            },
            hintText: 'Enter your Password',
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureTextIcon = !obscureTextIcon;
                });
              },
              child: Icon(
                obscureTextIcon ? Icons.visibility : Icons.visibility_off,
                color: ColorsManger.primaryColor,
                size: 22.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
