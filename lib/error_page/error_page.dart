import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paitent_registration/app_color/app_colors.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "OOPS Something went wrong",
      style: TextStyle(
          fontSize: 40.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black51),
    ));
  }
}
