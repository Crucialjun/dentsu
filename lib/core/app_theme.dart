import 'package:dentsu/core/constants/app_color_pallete.dart';
import 'package:dentsu/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData(Brightness brightness) => ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: dentsupallete,
          brightness: brightness,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.dmSans().fontFamily,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 21.w, vertical: 19.h),
          fillColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.unselectedColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90.r),
              ),
              minimumSize: Size(345.w, 51.h)),
        ),
      );
}
