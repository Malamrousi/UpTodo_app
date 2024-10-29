//packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/di/dependency_injection.dart';
import 'package:uptodo/firebase_options.dart';
//material app
import 'package:uptodo/up_to_do.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
    
    // تهيئة Firebase مع الإعدادات الصحيحة
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // تكوين Firebase Auth
    await FirebaseAuth.instance.setSettings(
      appVerificationDisabledForTesting: true, // مفيد في بيئة التطوير
      forceRecaptchaFlow: false,
    );
  await ScreenUtil.ensureScreenSize();
  setUpGetIt();
  runApp(const UpToDo());
}
