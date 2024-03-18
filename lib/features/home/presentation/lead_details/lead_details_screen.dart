import 'package:dentsu/core/constants/app_assets.dart';
import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/core/models/lead_model.dart';
import 'package:dentsu/features/home/presentation/lead_details/components/lead_details_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:intl/intl.dart';

class LeadDetailsScreen extends StatefulWidget {
  static const routeName = '/lead-details';
  const LeadDetailsScreen({super.key, required this.lead});

  final Lead lead;

  @override
  State<LeadDetailsScreen> createState() => _LeadDetailsScreenState();
}

class _LeadDetailsScreenState extends State<LeadDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 36.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 16.r,
                      color: AppColors.primaryColor,
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
                      " / ${widget.lead.index}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 41.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 29.w, vertical: 28.h),
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
                                widget.lead.isContacted
                                    ? "Contacted"
                                    : "Not Contacted",
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
                            side:
                                const BorderSide(color: AppColors.primaryColor),
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
                            side:
                                const BorderSide(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(90.r),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Next", style: TextStyle(fontSize: 16.sp)),
                          Icon(Icons.arrow_forward, size: 14.h),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 36.h,
                      ),
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(60.0),
                              child: SizedBox(
                                  height: 60.h,
                                  width: 60.w,
                                  child: Image.network(
                                    "https://picsum.photos/seed/picsum/60",
                                    fit: BoxFit.cover,
                                  ))),
                          SizedBox(
                            width: 17.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.lead.customerName,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    )),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text("Nairobi, Kenya",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.dividerColor, width: 1.w)),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 14.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Lead Created",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                  DateFormat("dd MMM yyyy").format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          (int.parse(widget.lead.dateCreated)) *
                                              1000)),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.dividerColor, width: 1.w)),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 14.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Last Contacted",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                  DateFormat("dd MMM yyyy").format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          (int.parse(
                                                  widget.lead.lastContacted)) *
                                              1000)),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.dividerColor, width: 1.w)),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 14.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Next Appointment",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                  DateFormat("dd MMM yyyy").format(DateTime
                                      .fromMillisecondsSinceEpoch((int.parse(
                                              widget.lead.nextAppointment)) *
                                          1000)),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 52.h,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 560.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 41.h, horizontal: 42.w),
                  child: Column(
                    children: [
                      TabBar(
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        controller: _tabController,
                        tabs: const [
                          Tab(
                            text: "Lead Details",
                          ),
                          Tab(
                            text: "Assigned Lead",
                          )
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                            controller: _tabController,
                            children: [
                              LeadDetailsTabView(lead: widget.lead),
                              Container()
                            ]),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
