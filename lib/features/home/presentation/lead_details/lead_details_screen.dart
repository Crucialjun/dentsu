import 'package:dentsu/core/constants/app_assets.dart';
import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/core/models/lead_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;

class LeadDetailsScreen extends StatelessWidget {
  static const routeName = '/lead-details';
  const LeadDetailsScreen({super.key, required this.lead});

  final Lead lead;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 81.h,
        backgroundColor: Theme.of(context).primaryColor,
        title: SvgPicture.asset(
          'assets/svg/logo.svg',
          width: 58.w,
          height: 37.h,
        ),
        automaticallyImplyLeading: false,
        actions: [
          badges.Badge(
            badgeStyle: const badges.BadgeStyle(
              badgeColor: AppColors.badgeColor,
            ),
            position: badges.BadgePosition.bottomEnd(
              bottom: 0.h,
              end: 0.w,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: SizedBox(
                    height: 30.h,
                    width: 30.w,
                    child: Image.network(
                      "https://picsum.photos/seed/picsum/30",
                      fit: BoxFit.cover,
                    ))),
          ),
          SizedBox(
            width: 26.w,
          ),
          Icon(Icons.search, size: 25.r, color: Colors.white),
          SizedBox(
            width: 26.w,
          ),
          Icon(Icons.menu, size: 27.r, color: Colors.white),
          SizedBox(
            width: 19.w,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 36.h,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 16.r,
                    color: AppColors.primaryColor,
                  ),
                ),
                const Text(
                  "Back to all leads ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor),
                ),
                SizedBox(
                  width: 18.w,
                ),
                Text(
                  " / ${lead.index}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 41.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.r))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 28.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Lead Status"),
                    Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            AppColors.leadStatusGradientStart,
                            AppColors.leadStatusGradientEnd
                          ]),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.w, vertical: 8.h),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20.r,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text(
                              lead.isContacted ? "Contacted" : "Not Contacted",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
                            SizedBox(
                              width: 26.w,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 29.w, vertical: 13.h),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(90.r),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          AppAssets.cancel,
                          width: 14.w,
                          height: 14.h,
                          color: AppColors.primaryColor,
                        ),
                        Text(
                          "Cancel Lead",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 29.w, vertical: 13.h),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(90.r),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Next"),
                        Icon(Icons.arrow_forward, size: 12.r),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: const Column(
                  children: [],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
