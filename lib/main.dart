//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//material app
import 'package:uptodo/up_to_do.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(const UpToDo());
}