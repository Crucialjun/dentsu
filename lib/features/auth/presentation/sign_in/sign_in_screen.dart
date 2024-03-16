import 'package:dentsu/core/constants/app_assets.dart';
import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/features/auth/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.logo,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text("Welcome to Dentsu LMS",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                                "A tool that leverage's the power of data and artificial intelligence to drive digital transformation at scale",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 61.h,
                      ),
                      const Row(
                        children: [
                          Text("Username",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            hintText: "Enter your email or username",
                            hintStyle: TextStyle(
                                color: AppColors.hintTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      const Row(
                        children: [
                          Text("Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            hintText: "Enter your Password",
                            hintStyle: TextStyle(
                                color: AppColors.hintTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<SignInBloc>().add(
                              KeepMeLoggedInToogleEvent(!state.keepMeLoggedIn));
                        },
                        child: Row(
                          children: [
                            state.keepMeLoggedIn
                                ? SvgPicture.asset(AppAssets.checkedCheckBox,
                                    color: Colors.white,
                                    height: 24.h,
                                    width: 24.w)
                                : SvgPicture.asset(AppAssets.uncheckedCheckBox,
                                    color: Colors.white,
                                    height: 24.h,
                                    width: 24.w),
                            SizedBox(
                              width: 11.w,
                            ),
                            const Text("Keep me logged in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 62.h,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<SignInBloc>().add(
                                SignInWithEmailAndPasswordEvent(
                                    _emailController.text,
                                    _passwordController.text));
                          },
                          child: state is SignInLoading
                              ? const CircularProgressIndicator()
                              : const Text(
                                  "Log In",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                )),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .read<SignInBloc>()
                              .add(DontHaveAnAccountEvent());
                        },
                        child: const Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
