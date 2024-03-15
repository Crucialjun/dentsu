import 'package:dentsu/core/app_theme.dart';
import 'package:dentsu/features/presentation/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 932),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dentsu',
          theme: AppTheme.themeData(Brightness.light),
          darkTheme: AppTheme.themeData(Brightness.dark),
          home: const SignInScreen(),
        );
      },
    );
  }
}
