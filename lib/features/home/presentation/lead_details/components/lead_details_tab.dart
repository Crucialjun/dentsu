import 'package:dentsu/core/models/lead_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeadDetailsTabView extends StatelessWidget {
  const LeadDetailsTabView({super.key, required this.lead});
  final Lead lead;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "LeadSource",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 7.h),
        Text(
          lead.leadSource,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
