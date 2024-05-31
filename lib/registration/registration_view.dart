import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:paitent_registration/app_buttons/app_buttons.dart';
import 'package:paitent_registration/app_color/app_colors.dart';
import 'package:paitent_registration/assets/icons.dart';
import 'package:paitent_registration/assets/images.dart';
import 'package:paitent_registration/error_page/error_page.dart';
import 'package:paitent_registration/loading_animation/loading_animation.dart';
import 'package:paitent_registration/registration/registration_controller.dart';
import 'package:paitent_registration/registration/registration_model.dart';

import '../Validator/validators.dart';
import '../text_fields/text_fields.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<RegistrationController>(builder: (controller) {
        return controller.isLoading.value
            ? LoadingBarsAnimation(
                padding: EdgeInsets.symmetric(horizontal: 300.sp),
              )
            : controller.isError.value
                ? const ErrorPage()
                : ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Container(
                        height: Get.height,
                        width: Get.width,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImages.backGroundImage),
                                fit: BoxFit.cover)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(40.sp)),
                          margin: EdgeInsets.all(50.sp),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.sp, vertical: 40.sp),
                          child: Form(
                            key: RegistrationController.to.registrationFormKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "PATIENT REGISTRATION ",
                                  style: TextStyle(
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 30.sp,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 380.sp,
                                      child: AppTextFormField(
                                          controller: RegistrationController
                                              .to.controllerFullName,
                                          validator: (value) =>
                                              Validators.isEmpty(value: value),
                                          header: "Full Name*"),
                                    ),
                                    SizedBox(
                                      width: 380.sp,
                                      child: GetX<RegistrationController>(
                                          builder: (controller) {
                                        return AppTextFormField(
                                            controller: RegistrationController
                                                .to.controllerMobileNumber,
                                            textInputType: TextInputType.number,
                                            errorText: controller
                                                .errorMessageMobile.value,
                                            onChanged: (value) => controller
                                                .errorMessageMobile
                                                .value = null,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            validator: (value) =>
                                                Validators.isMobile(
                                                    value: value),
                                            maxLength: 10,
                                            header: "Mobile Number*");
                                      }),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 380.sp,
                                      child: GetX<RegistrationController>(
                                          builder: (controller) {
                                        return AppTextFormField(
                                            controller: RegistrationController
                                                .to.controllerEmail,
                                            errorText: controller
                                                .errorMessageEmail.value,
                                            onChanged: (value) => controller
                                                .errorMessageEmail.value = null,
                                            validator: (value) =>
                                                Validators.isEMail(
                                                    value: value),
                                            header: "Email Address*");
                                      }),
                                    ),
                                    SizedBox(
                                      width: 380.sp,
                                      child: GetX<RegistrationController>(
                                          builder: (controller) {
                                        return AppDropDownFormField(
                                          header: "Gender*",
                                          validator: (value) =>
                                              Validators.isEmpty(
                                                  value: value?.name),
                                          onChange: (value) =>
                                              RegistrationController.to
                                                  .selectedGender.value = value,
                                          value: RegistrationController
                                              .to.selectedGender.value,
                                          itemList: RegistrationController
                                              .to.genderList,
                                          label: (value) => value.name ?? "",
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 380.sp,
                                      child: AppDatePickerFormField(
                                          controller: RegistrationController
                                              .to.controllerDateOfBirth,
                                          header: "DOB"),
                                    ),
                                    SizedBox(
                                      width: 380.sp,
                                      child: GetX<RegistrationController>(
                                          builder: (controller) {
                                        return AppDropDownFormField(
                                          header: "Blood Group*",
                                          onChange: (value) =>
                                              RegistrationController
                                                  .to
                                                  .selectedBloodGroup
                                                  .value = value,
                                          value: RegistrationController
                                              .to.selectedBloodGroup.value,
                                          itemList: RegistrationController
                                              .to.bloodGroups,
                                          label: (value) => value.name ?? "",
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 380.sp,
                                      child: GetX<RegistrationController>(
                                          builder: (controller) {
                                        return AppDropDownFormField(
                                          header: "Marital Status*",
                                          onChange: (value) =>
                                              RegistrationController
                                                  .to
                                                  .selectedMaritalStatuses
                                                  .value = value,
                                          value: RegistrationController
                                              .to.selectedMaritalStatuses.value,
                                          itemList: RegistrationController
                                              .to.maritalStatuses,
                                          label: (value) => value.name ?? "",
                                        );
                                      }),
                                    ),
                                    SizedBox(
                                      width: 380.sp,
                                      child: AppTextFormField(
                                          controller: RegistrationController
                                              .to.controllerWhatsAppNumber,
                                          textInputType: TextInputType.phone,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          maxLength: 10,
                                          header: "WhatsApp Number*"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 380.sp,
                                      child: AppTextFormField(
                                          controller: RegistrationController.to
                                              .controllerEmergencyContactNumber,
                                          textInputType: TextInputType.phone,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          maxLength: 10,
                                          header: "Emergency Contact Number"),
                                    ),
                                    SizedBox(
                                      width: 380.sp,
                                      child: AppTextFormField(
                                          controller: RegistrationController.to
                                              .controllerEmergencyContactPerson,
                                          header: "Emergency Contact Person"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                AppTextFormField(
                                    controller: RegistrationController
                                        .to.controllerAddress,
                                    maxLInes: 5,
                                    minLines: 3,
                                    header: "Address"),
                                SizedBox(height: 50.sp),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 100.sp),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GetX<RegistrationController>(
                                          builder: (controller) {
                                        return GreenGradientButton(
                                          text: "Save",
                                          width: 280.sp,
                                          isLoading:
                                              controller.isButtonLoading.value,
                                          onTap: () => RegistrationController.to
                                              .register(),
                                        );
                                      }),
                                      WhiteGradientButton(
                                        text: "Reset",
                                        width: 280.sp,
                                        onTap: () =>
                                            RegistrationController.to.reset(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
      }),
    );
  }
}

class SuccessFullRegistrationPopUp extends StatelessWidget {
  const SuccessFullRegistrationPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50.sp),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(40.sp)),
      child: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(
            AppIcons.success,
            width: 130.sp,
            height: 130.sp,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 50.sp,
          ),
          Text(
            "REGISTRATION SUCCESSFUL!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.black51,
                fontSize: 50.sp),
          ),
          SizedBox(
            height: 70.sp,
          ),
          Text(
            "Welcome to Ayushman",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 35.sp,
                color: AppColors.green61),
          ),
          Text(
            "Congratulations, your account has been successfully created. Thank you for choosing us.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35.sp, color: AppColors.black51),
          ),
          SizedBox(
            height: 50.sp,
          ),
          GreenGradientButton(
            text: "Home",
            width: 280.sp,
            onTap: () => Get.back(),
          ),
          SizedBox(
            height: 70.sp,
          ),
          Text(
            "Get the Ayushman patient app on",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25.sp, color: AppColors.black51),
          ),
          SizedBox(
            height: 30.sp,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 140.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: RegistrationController.to.downloadFromOptions
                  .map((option) => DownloadFromOptionsContainer(option: option))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class DownloadFromOptionsContainer extends StatelessWidget {
  final DownloadFromOptions option;
  const DownloadFromOptionsContainer({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 240.sp),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
        decoration: BoxDecoration(
            color: AppColors.black, borderRadius: BorderRadius.circular(10.sp)),
        child: Row(
          children: [
            SvgPicture.asset(option.icon),
            SizedBox(
              width: 10.sp,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  option.text,
                  style: TextStyle(fontSize: 15.sp, color: AppColors.white),
                ),
                Text(
                  option.text,
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
