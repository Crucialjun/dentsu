import 'package:dentsu/core/constants/app_assets.dart';
import 'package:dentsu/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 39.w),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(
              AppAssets.logo,
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text("Welcome to Dentsu LMS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                      "A tool that leverage's the power of data and artificial intelligence to drive digital transformation at scale",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
            SizedBox(
              height: 61.h,
            ),
            Row(
              children: [
                Text("Username",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter your email or username",
                  hintStyle: TextStyle(
                      color: AppColors.hintTextColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400)),
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              children: [
                Text("Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter your Password",
                  hintStyle: TextStyle(
                      color: AppColors.hintTextColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400)),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SvgPicture.asset(AppAssets.checkedCheckBox,
                    color: Colors.white, height: 24.h, width: 24.w),
                SizedBox(
                  width: 11.w,
                ),
                Text("Keep me logged in",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            SizedBox(
              height: 62.h,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Log In",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp),
                )),
          ]),
        ),
      ),
    );
  }
}
