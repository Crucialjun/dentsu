import 'package:dentsu/core/constants/app_colors.dart';
import 'package:dentsu/core/models/quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuoteInformationTab extends StatelessWidget {
  const QuoteInformationTab({super.key, required this.quote});

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("First Name",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.firstName,
              decoration: const InputDecoration(
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
            const Text("Middle Name",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.middleName,
              decoration: const InputDecoration(
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
            const Text("Last Name",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.lastName,
              decoration: const InputDecoration(
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
            const Text("Originating Lead Source",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.originatingLeadSource,
              decoration: const InputDecoration(
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
            const Text("Quote ID",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.quoteId,
              decoration: const InputDecoration(
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
            const Text("Owning Business Unit",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.owningBusinessUnit,
              decoration: const InputDecoration(
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
            const Text("Lead ID",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.leadId.toString(),
              decoration: const InputDecoration(
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
            const Text("Source",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.source,
              decoration: const InputDecoration(
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
            const Text("Capturing User",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              initialValue: quote.capturingUser,
              decoration: const InputDecoration(
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
