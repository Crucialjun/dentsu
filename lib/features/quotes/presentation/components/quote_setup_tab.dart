import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/core/models/quote.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class QuoteSetupTab extends StatelessWidget {
  const QuoteSetupTab({super.key, required this.quote});
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
            const Text("Age Bracket",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            DropDownTextField(
              dropDownList: [
                DropDownValueModel(
                    name: quote.ageBracket ?? "", value: quote.ageBracket)
              ],
              clearOption: false,
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.ageBracket,
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
              height: 26.h,
            ),
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
              height: 26.h,
            ),
            const Text("Spouse Covered",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            DropDownTextField(
              dropDownList: [
                DropDownValueModel(
                    name: quote.spouseCovered ?? "", value: quote.spouseCovered)
              ],
              clearOption: false,
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.spouseCovered,
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
              height: 26.h,
            ),
            const Text("How many children?",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            DropDownTextField(
              dropDownList: [
                DropDownValueModel(
                    name: "${quote.children} children", value: quote.children)
              ],
              clearOption: false,
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: "${quote.children} children",
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
              height: 26.h,
            ),
            const Text("Cover Children?",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            DropDownTextField(
              dropDownList: [
                DropDownValueModel(
                    name: quote.coverChildren ?? "", value: quote.coverChildren)
              ],
              clearOption: false,
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.coverChildren ?? "",
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
              height: 26.h,
            ),
            const Text("Spouse Age Bracket",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            DropDownTextField(
              dropDownList: [
                DropDownValueModel(
                    name: quote.spouseAgeBracket ?? "",
                    value: quote.spouseAgeBracket)
              ],
              clearOption: false,
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.spouseAgeBracket,
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
          ],
        ),
      ),
    );
  }
}
