import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color/app_colors.dart';

class AppThemes {
  static AppBarTheme appBarTheme = AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          color: AppColors.white));
  static DatePickerThemeData datePickerThemeData = DatePickerThemeData(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      todayBackgroundColor: MaterialStateProperty.resolveWith((states) =>
          states.contains(MaterialState.selected) ? AppColors.green0 : null),
      cancelButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(AppColors.black51),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontWeight: FontWeight.w700))),
      confirmButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(AppColors.black51),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontWeight: FontWeight.w700))),
      todayBorder: BorderSide(color: AppColors.green0),
      dayBackgroundColor: MaterialStateProperty.resolveWith((states) =>
          states.contains(MaterialState.selected) ? AppColors.green0 : null));
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    isDense: true,
    floatingLabelStyle: TextStyle(fontSize: 24.sp, color: AppColors.grey102),
    labelStyle: TextStyle(fontSize: 24.sp, color: AppColors.grey102),
    filled: true,
    hintStyle: TextStyle(fontSize: 20.sp, color: AppColors.black),
    fillColor: AppColors.white,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 10.sp,
    ),
    border: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey208)),
    enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey208)),
    focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey208)),
    disabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey208)),
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    alignLabelWithHint: true,
  );
}
