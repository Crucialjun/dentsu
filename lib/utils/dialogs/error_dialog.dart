import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 32.h,
            horizontal: 16.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Error',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16.h,
              ),
              Icon(
                Icons.error,
                size: 64.r,
                color: Colors.red,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                message,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 16.h,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
