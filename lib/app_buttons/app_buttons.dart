import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color/app_colors.dart';

class GreenGradientButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final bool? isLoading;
  final void Function()? onTap;
  const GreenGradientButton({
    super.key,
    required this.text,
    this.height,
    this.fontSize,
    this.width,
    this.radius,
    this.onTap,
    this.isLoading,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.all(5.sp),
              height: (isLoading ?? false) ? 60.sp : height ?? 60.sp,
              width: (isLoading ?? false) ? 60.sp : width ?? 380.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 60.sp),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.green61, AppColors.green0])),
              child: Center(
                child: isLoading == true
                    ? const CircularProgressIndicator(
                        color: AppColors.white,
                      )
                    : Text(
                        text,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: fontSize ?? 20.sp,
                            color: AppColors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WhiteGradientButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final bool? isLoading;
  final void Function()? onTap;
  const WhiteGradientButton({
    super.key,
    required this.text,
    this.height,
    this.fontSize,
    this.width,
    this.radius,
    this.onTap,
    this.isLoading,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.all(5.sp),
              height: (isLoading ?? false) ? 60.sp : height ?? 60.sp,
              width: (isLoading ?? false) ? 60.sp : width ?? 380.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 60.sp),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.grey230, AppColors.white231])),
              child: Center(
                child: isLoading ?? false
                    ? const CircularProgressIndicator(
                        color: AppColors.grey135,
                      )
                    : Text(
                        text,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: fontSize ?? 22.sp,
                            color: AppColors.grey102),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
