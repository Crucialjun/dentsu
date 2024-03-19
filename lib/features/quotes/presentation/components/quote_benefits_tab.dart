import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/core/models/quote.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                      height: 29.h,
                    ),
                    Row(
                      children: [
                        Text("Inpatient")
                        
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
