import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/features/home/presentation/home/bloc/home_bloc.dart';
import 'package:dentsu/features/home/presentation/home/components/leads_graph.dart';
import 'package:dentsu/features/home/presentation/home/components/new_leads_table.dart';
import 'package:dentsu/features/home/presentation/home/components/total_leads_gauge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              const Row(
                children: [
                  Text(
                    "Dashboard",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 310.h,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) {
                        return current is HomeLeadsCountLoaded;
                      },
                      builder: (context, state) {
                        if (state is HomeLeadsCountLoaded) {
                          return TotalLeadsGauge(
                            totalLeads: state.totalLeads,
                            contactedLeads: state.contactedLeadsCount,
                          );
                        }
                        return Container();
                      },
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    const LeadsGraph(),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              const Row(
                children: [
                  Text("New Leads",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              const NewLeadsTable(),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
