import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationHolder extends StatelessWidget {
  static const routeName = '/bottom-navigation-holder';
  const BottomNavigationHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 21.w),
          child: SvgPicture.asset(
            'assets/svg/logo.svg',
            width: 58.w,
            height: 37.h,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 20.r,
            child: Image.network("https://picsum.photos/seed/picsum/24"),
          ),
          SizedBox(
            width: 21.w,
          )
        ],
      ),
      body: const Center(
        child: Text('Bottom Navigation Holder'),
      ),
    );
  }
}
