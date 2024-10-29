//packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//core
import '../../../../../core/helper/app_regx.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/app_text_form_filed.dart';
//cubit
import '../../cubit/register_cubit/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool obscureTextIcon = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          InputTextFormFiled(
            controller: context.read<RegisterCubit>().nameController,
            keyboardType: TextInputType.name,
            inputTextType: 'Username',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isNameValid(value)) {
                return 'Please enter valid Name';
              }
            },
            hintText: 'Enter your Name',
          ),
          verticalSpacing(15),
          InputTextFormFiled(
            controller: context.read<RegisterCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            inputTextType: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter valid Email';
              }
            },
            hintText: 'Enter your Email',
          ),
          verticalSpacing(15),
          InputTextFormFiled(
            controller: context.read<RegisterCubit>().passwordController,
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
                color: ColorsManger.purpleColor,
                size: 22.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
