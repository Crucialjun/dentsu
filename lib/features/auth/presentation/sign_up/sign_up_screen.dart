import 'package:dentsu/core/constants/app_assets.dart';
import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/utils/app_text_form_field_validators.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    child: Text("Create your Dentsu LMS Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Text("Email",
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
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return AppTextFormFieldValidators.validateEmail(value);
                },
                decoration: InputDecoration(
                    hintText: "Enter your email",
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
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  return AppTextFormFieldValidators.validatePassword(value);
                },
                decoration: InputDecoration(
                    hintText: "Enter your Password",
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
                  Text("Confirm Password",
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
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  return AppTextFormFieldValidators.validateConfirmPassword(
                      value: value, password: _passwordController.text);
                },
                decoration: InputDecoration(
                    hintText: "Confirm your Password",
                    hintStyle: TextStyle(
                        color: AppColors.hintTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                    }
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
