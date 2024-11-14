//packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/di/dependency_injection.dart';
//material app
import 'package:uptodo/up_to_do.dart';

import 'core/observering/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await ScreenUtil.ensureScreenSize();
  setUpGetIt();

  Bloc.observer = SimpleBlocObserver();

  runApp(const UpToDo());
}
