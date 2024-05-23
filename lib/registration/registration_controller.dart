import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paitent_registration/api_services/api_services.dart';
import 'package:paitent_registration/app_color/app_colors.dart';
import 'package:paitent_registration/app_extensions/app_extensions.dart';
import 'package:paitent_registration/assets/icons.dart';
import 'package:paitent_registration/registration/registration_model.dart';
import 'package:paitent_registration/registration/registration_view.dart';

import '../snack_bar/snack_bar.dart';

class RegistrationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }
}

class RegistrationController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    try {
      isLoading.value = true;
      await Future.wait([
        getGender(),
        getBloodGroup(),
        getMaritalStatus(),
      ]);
      isError.value = false;
    } catch (error) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  static RegistrationController get to => Get.find();

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  List<DownloadFromOptions> downloadFromOptions = [
    DownloadFromOptions(
        icon: AppIcons.apple, text: "Download on the", platform: "App Store"),
    DownloadFromOptions(
        icon: AppIcons.playStore, text: "GET IT ON", platform: "Google Play")
  ];
//==============================================================================

  List<Gender> genderList = [];
  Rx<Gender?> selectedGender = Rx<Gender?>(null);
  Future<void> getGender() async {
    GetGenderResponseModel response = await ApiServices.getGenders();
    genderList = response.data ?? [];
  }

//==============================================================================
  List<BloodGroup> bloodGroups = [];
  Rx<BloodGroup?> selectedBloodGroup = Rx<BloodGroup?>(null);
  Future<void> getBloodGroup() async {
    GetBloodGroupResponseModel response = await ApiServices.getBloodGroup();
    bloodGroups = response.data ?? [];
  }

//==============================================================================
  List<MaritalStatus> maritalStatuses = [];
  Rx<MaritalStatus?> selectedMaritalStatuses = Rx<MaritalStatus?>(null);
  Future<void> getMaritalStatus() async {
    GetMaritalStatusResponseModel response =
        await ApiServices.getMaritalStatus();
    maritalStatuses = response.data ?? [];
  }

//==============================================================================
  TextEditingController controllerFullName = TextEditingController();
  TextEditingController controllerMobileNumber = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerDateOfBirth = TextEditingController();
  TextEditingController controllerWhatsAppNumber = TextEditingController();
  TextEditingController controllerEmergencyContactNumber =
      TextEditingController();
  TextEditingController controllerEmergencyContactPerson =
      TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
//==============================================================================

  GlobalKey<FormState> registrationFormKey = GlobalKey();
  RxBool isButtonLoading = false.obs;
  Rx<String?> errorMessageEmail = Rx<String?>(null);
  Rx<String?> errorMessageMobile = Rx<String?>(null);
//==============================================================================
  register() async {
    try {
      isButtonLoading.value = true;
      if (registrationFormKey.currentState?.validate() ?? false) {
        Map<String, dynamic> body = {
          "patient_name": controllerFullName.text,
          "patient_mobile": controllerMobileNumber.text,
          "patient_gender": selectedGender.value!.id,
          "patient_dob": controllerDateOfBirth.text.changeDateFormat(),
          "patient_email": controllerEmail.text,
          "marital_status": selectedMaritalStatuses.value?.id,
          "patient_blood_group": selectedBloodGroup.value?.id,
          "whatsapp_number": controllerWhatsAppNumber.text,
          "emergency_contact_person": controllerEmergencyContactPerson.text,
          "emergency_contact": controllerEmergencyContactNumber.text,
          "patient_address": controllerAddress.text
        };
        RegistrationResponseModel response =
            await ApiServices.register(body: body);
        if (response.status == 1) {
          Get.dialog(
              barrierColor: AppColors.black51.withOpacity(.3),
              const Dialog(child: SuccessFullRegistrationPopUp()));
          registrationFormKey.currentState?.reset();
        } else {
          errorMessageEmail.value = response.errors?.patientEmail;
          errorMessageMobile.value = response.errors?.patientMobile;
          Get.showSnackbar(GetSnackBar(
              duration: const Duration(seconds: 5),
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
              messageText: AppSnackBar(text: response.message ?? " ")));
        }
      }
    } catch (error) {
      Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 5),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          messageText: AppSnackBar()));
    } finally {
      isButtonLoading.value = false;
    }
  }

//==============================================================================
  reset() {
    controllerFullName.clear();
    controllerMobileNumber.clear();
    controllerEmail.clear();
    selectedGender.value = null;
    controllerDateOfBirth.clear();
    selectedBloodGroup.value = null;
    selectedMaritalStatuses.value = null;
    controllerWhatsAppNumber.clear();
    controllerEmergencyContactNumber.clear();
    controllerEmergencyContactPerson.clear();
    controllerAddress.clear();
    registrationFormKey.currentState?.reset();
  }
}
