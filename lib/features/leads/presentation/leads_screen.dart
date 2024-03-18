import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/features/home/presentation/home/components/new_leads_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeadsScreen extends StatelessWidget {
  static const routeName = '/leads';
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    const Text(
                      "Leads",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.w, vertical: 10.h),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(0, 0)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              size: 20,
                            ),
                            SizedBox(
                              width: 13.w,
                            ),
                            const Text("New Lead"),
                          ],
                        )),
                    SizedBox(
                      width: 28.w,
                    ),
                    const Icon(
                      Icons.more_horiz,
                      size: 20,
                      color: Colors.black,
                    )
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                const NewLeadsTable()
              ],
            ),
          ),
        ));
  }
}
