import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color/app_colors.dart';

class AppSnackBar extends StatelessWidget {
  final String? text;
  const AppSnackBar({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 30.sp),
      margin: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: AppColors.green0,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Text(
        text ?? "OOPS Something went wrong",
        style: TextStyle(color: AppColors.white, fontSize: 20.sp),
      ),
    );
  }
}
