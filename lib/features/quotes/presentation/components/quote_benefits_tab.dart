import 'package:dentsu/core/constants/app_assets.dart';
import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/core/models/quote.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class QuoteBenefitsTab extends StatelessWidget {
  const QuoteBenefitsTab({super.key, required this.quote});
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,000');
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Inpatient Cover Limit",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            DropDownTextField(
              dropDownList: [
                DropDownValueModel(
                    name: "KES ${formatter.format(quote.inPatientCoverLimit)}",
                    value: quote.inPatientCoverLimit)
              ],
              clearOption: false,
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue:
                  "KES ${formatter.format(quote.inPatientCoverLimit)}",
              textFieldDecoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.inputFieldOutlineColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.inputFieldOutlineColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.inputFieldOutlineColor),
                ),
              ),
              readOnly: true,
            ),
            SizedBox(
              height: 29.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 28.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Benefits",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Inpatient",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                        Switch(
                            inactiveTrackColor:
                                AppColors.inactiveSwitchColor.withOpacity(0.6),
                            value: quote.benefits == "Inpatient",
                            onChanged: (value) {})
                      ],
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Outpatient",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                        Switch(
                            inactiveTrackColor:
                                AppColors.inactiveSwitchColor.withOpacity(0.6),
                            value: quote.benefits == "Outpatient",
                            onChanged: (value) {})
                      ],
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("No Co-payment",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                        Switch(
                            inactiveTrackColor:
                                AppColors.inactiveSwitchColor.withOpacity(0.6),
                            value: quote.benefits == "No Co-payment",
                            onChanged: (value) {})
                      ],
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Dental",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                        Switch(
                            inactiveTrackColor:
                                AppColors.inactiveSwitchColor.withOpacity(0.6),
                            value: quote.benefits == "Dental",
                            onChanged: (value) {})
                      ],
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Optical",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                        Switch(
                            inactiveTrackColor:
                                AppColors.inactiveSwitchColor.withOpacity(0.6),
                            value: quote.benefits == "Optical",
                            onChanged: (value) {})
                      ],
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Maternity",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                        Switch(
                            inactiveTrackColor:
                                AppColors.inactiveSwitchColor.withOpacity(0.6),
                            value: quote.benefits == "Maternity",
                            onChanged: (value) {})
                      ],
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Last Expense",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                        Switch(
                            inactiveTrackColor:
                                AppColors.inactiveSwitchColor.withOpacity(0.6),
                            value: quote.benefits == "Last Expense",
                            onChanged: (value) {})
                      ],
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Personal Accident",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                        Switch(
                            inactiveTrackColor:
                                AppColors.inactiveSwitchColor.withOpacity(0.6),
                            value: quote.benefits == "Personal Accident",
                            onChanged: (value) {})
                      ],
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Enhanced Covid 19 Cover",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                        Switch(
                            inactiveTrackColor:
                                AppColors.inactiveSwitchColor.withOpacity(0.6),
                            value: quote.benefits == "Enhanced Covid 19 Cover",
                            onChanged: (value) {})
                      ],
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Amref Evacuation",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                        Switch(
                            inactiveTrackColor:
                                AppColors.inactiveSwitchColor.withOpacity(0.6),
                            value: quote.benefits == "Amref Evacuation",
                            onChanged: (value) {})
                      ],
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 46.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.primaryColor, width: 3)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 39.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Premium Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        SvgPicture.asset(AppAssets.premiumSummaryIcon)
                      ],
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "KES 131,435",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Radio(
                            value: false,
                            groupValue: "paymentOption",
                            onChanged: (value) {}),
                        SizedBox(
                          width: 8.w,
                        ),
                        const Text(
                          "M-Pesa PayBill",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        const Expanded(child: SizedBox()),
                        Image.asset(
                          AppAssets.mpesaLogoPng,
                          width: 84.w,
                          height: 59.h,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: false,
                            groupValue: "paymentOption",
                            onChanged: (value) {}),
                        SizedBox(
                          width: 8.w,
                        ),
                        const Text(
                          "Credit / Debit Card",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        const Expanded(child: SizedBox()),
                        Image.asset(
                          AppAssets.visaMasterLogo,
                          width: 98.w,
                          height: 24.h,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 44.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
