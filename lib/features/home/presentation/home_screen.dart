import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/features/home/presentation/bloc/home_bloc.dart';
import 'package:dentsu/features/home/presentation/components/leads_graph.dart';
import 'package:dentsu/features/home/presentation/components/total_leads_gauge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';

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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                width: double.infinity,
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLeadsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is HomeLeadsError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    if (state is HomeLeadsLoaded) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 42.w, vertical: 35.h),
                        child: Column(
                          children: [
                            DataTable(
                              columns: const [
                                DataColumn(
                                    label: Text(
                                  "#",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                                DataColumn(
                                    label: Text("Customer Name",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))),
                              ],
                              rows: state.leads
                                  .map((e) => DataRow(cells: [
                                        DataCell(Text(e.index.toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ))),
                                        DataCell(Text(e.customerName,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ))),
                                      ]))
                                  .toList(),
                            ),
                            SizedBox(
                              height: 42.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Showing ${(state.currentPageIndex) * 10 - 9} to ${(state.currentPageIndex) * 10} of ${state.totalLeads}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            NumberPaginator(
                              onPageChange: (int page) {
                                print(page);
                              },
                              numberPages: state.totalLeads ~/ 10,
                              config: const NumberPaginatorUIConfig(
                                  buttonTextStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  buttonUnselectedForegroundColor:
                                      Colors.black),
                            )
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
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
