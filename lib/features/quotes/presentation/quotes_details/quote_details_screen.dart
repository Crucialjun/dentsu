import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/core/models/quote.dart';
import 'package:dentsu/features/quotes/presentation/components/quote_information_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;

class QuoteDetailsScreen extends StatefulWidget {
  static const routeName = '/quote-details';
  const QuoteDetailsScreen({super.key, required this.quote});

  final Quote quote;

  @override
  State<QuoteDetailsScreen> createState() => _QuoteDetailsScreenState();
}

class _QuoteDetailsScreenState extends State<QuoteDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
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
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            const Text("View Quote",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                )),
            TabBar(
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                controller: _tabController,
                tabs: const [
                  Tab(text: "Quote Information"),
                  Tab(text: "Setup"),
                  Tab(text: "Benefits"),
                ]),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                QuoteInformationTab(quote: widget.quote),
                QuoteInformationTab(quote: widget.quote),
                QuoteInformationTab(quote: widget.quote)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
