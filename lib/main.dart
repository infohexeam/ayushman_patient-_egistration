import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paitent_registration/app_routes/app_routes.dart';

import 'app_color/app_colors.dart';
import 'app_pages/app_pages.dart';
import 'app_themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1024, 1366),
        builder: (context, builder) {
          return GetMaterialApp(
            title: 'Registration',
            theme: ThemeData(
                appBarTheme: AppThemes.appBarTheme,
                inputDecorationTheme: AppThemes.inputDecorationTheme,
                datePickerTheme: AppThemes.datePickerThemeData,
                scaffoldBackgroundColor: AppColors.white,
                textTheme: GoogleFonts.titilliumWebTextTheme(),
                primarySwatch: Colors.green),
            getPages: AppPages.appPages,
            initialRoute: AppRoutes.register,
          );
        });
  }
}
