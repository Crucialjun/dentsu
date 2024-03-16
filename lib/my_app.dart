import 'package:dentsu/core/app_theme.dart';
import 'package:dentsu/core/routes.dart';
import 'package:dentsu/features/auth/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:dentsu/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:dentsu/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:dentsu/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:dentsu/features/splash/presentation/splash_screen.dart';
import 'package:dentsu/services/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          scaffoldMessengerKey: INavigationService.snackbarKey,
          navigatorKey: INavigationService.navigatorKey,
          title: 'Dentsu',
          theme: AppTheme.themeData(Brightness.light),
          darkTheme: AppTheme.themeData(Brightness.dark),
          home: BlocProvider(
            create: (context) => SplashBloc()..add(SplashInitEvent()),
            child: const SplashScreen(),
          ),
          onGenerateRoute: (settings) => Routes.generateRoute(settings),
        );
      },
    );
  }
}
