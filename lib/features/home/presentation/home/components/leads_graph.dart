import 'package:dentsu/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LeadsGraph extends StatelessWidget {
  const LeadsGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Leads",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    )),
                Icon(
                  Icons.more_horiz,
                  size: 21.r,
                ),
              ],
            ),
            Expanded(
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    radiusFactor: 0.8,
                    annotations: [
                      GaugeAnnotation(
                          widget: Container(
                              width: 74.w,
                              height: 74.h,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(18.r),
                                  child: const Text(
                                    "47%",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )))
                    ],
                    axisLineStyle: const AxisLineStyle(
                      color: AppColors.graphUnfilledColor,
                      thickness: 16,
                      thicknessUnit: GaugeSizeUnit.logicalPixel,
                    ),
                    startAngle: 270,
                    endAngle: 270,
                    showLabels: false,
                    ranges: [
                      GaugeRange(
                          color: AppColors.primaryColor,
                          startValue: 0,
                          startWidth: 16,
                          endWidth: 16,
                          endValue: 47)
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 11.r,
                  height: 11.r,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                const Text(
                  "Contacted ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  "1.7K",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  width: 11.r,
                  height: 11.r,
                  decoration: BoxDecoration(
                    color: AppColors.graphUnfilledColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                const Text(
                  "Total Leads ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  "1.7K",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
