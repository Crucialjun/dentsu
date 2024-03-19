import 'package:dentsu/core/constants/app_assets.dart';
import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/features/bottom_nav_holder/presentation/bloc/bottom_nav_holder_bloc.dart';
import 'package:dentsu/features/quotes/presentation/quotes/bloc/quotes_bloc.dart';
import 'package:dentsu/features/quotes/presentation/quotes/quotes_screen.dart';
import 'package:dentsu/features/home/presentation/home/bloc/home_bloc.dart';
import 'package:dentsu/features/home/presentation/home/home_screen.dart';
import 'package:dentsu/features/leads/presentation/leads_screen.dart';
import 'package:dentsu/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationHolder extends StatelessWidget {
  static const routeName = '/bottom-navigation-holder';
  const BottomNavigationHolder({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      const LeadsScreen(),
      const QuotesScreen(),
      const ProfileScreen(),
    ];
    return BlocBuilder<BottomNavHolderBloc, BottomNavHolderState>(
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeBloc()..add(HomeInitEvent()),
            ),
            BlocProvider(
              create: (context) => QuotesBloc()..add(InitialQuotesEvent()),
            ),
          ],
          child: Scaffold(
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
            body: IndexedStack(
              index: state.currentIndex,
              children: screens,
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              child: BottomNavigationBar(
                enableFeedback: true,
                currentIndex: state.currentIndex,
                onTap: (value) {
                  context
                      .read<BottomNavHolderBloc>()
                      .add(BottomNavHolderIndexChangedEvent(value));
                },
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppAssets.home,
                      color: AppColors.unselectedColor,
                    ),
                    activeIcon: SvgPicture.asset(
                      AppAssets.home,
                      color: AppColors.primaryColor,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppAssets.leads,
                      color: AppColors.unselectedColor,
                    ),
                    activeIcon: SvgPicture.asset(
                      AppAssets.leads,
                      color: AppColors.primaryColor,
                    ),
                    label: 'Leads',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppAssets.business,
                      color: AppColors.unselectedColor,
                    ),
                    activeIcon: SvgPicture.asset(
                      AppAssets.business,
                      color: AppColors.primaryColor,
                    ),
                    label: 'Business',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppAssets.profile,
                      color: AppColors.unselectedColor,
                    ),
                    activeIcon: SvgPicture.asset(
                      AppAssets.profile,
                      color: AppColors.primaryColor,
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
