import 'package:intl/intl.dart';

///All validation function used in the app must be declared here and here only

class Validators {
  //check is the given string is empty or not
  final RegExp phoneRegExp = RegExp(r'^[6789]\d{9}$');
  static String? isEmpty({required String? value, String? errorText}) {
    if ((value ?? "").isEmpty) {
      return errorText ?? "This field is required";
    } else {
      return null;
    }
  }

  static String? validatePassword({String? value}) {
    if (value == null || value.isEmpty) return 'Please enter a new password';
    if (!value.contains(RegExp(r'[a-z]'))) {
      return "Password should contain at least 1 lower case letter";
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password should contain at least 1 upper case letter";
    }
    if (!value.contains(RegExp(r'[!@#\$&*~]'))) {
      return "Password should contain at least 1 special character";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password should contain at least 1 number";
    }
    if (value.length <= 8) {
      return "Password should contain at least 8 character";
    }
    return null;
  }

  String formatAmount(double amount) {
    final format = NumberFormat.decimalPattern('en');
    String formattedAmount = format.format(amount);
    return '₹ $formattedAmount'; // Add the ₹ symbol and space
  }

  //check is the given string is email or not
  static String? isEMail({required String? value}) {
    if (((value ?? "").isEmpty) || value == null) {
      return "Email is required";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  static String? dropdownValidatorRelation(String value) {
    if (value.isEmpty) {
      return 'Relation is required'; // Validation error message
    }
    return null; // Return null if there's no error
  }

  static String? dropdownValidatorGender(String value) {
    if (value.isEmpty) {
      return 'Gender is required'; // Validation error message
    }
    return null; // Return null if there's no error
  }

  static String? dropdownValidatorBloodGroup(String value) {
    if (value.isEmpty) {
      return 'Blood group is required'; // Validation error message
    }
    return null; // Return null if there's no error
  }

  //check is the given string is ,mobile or not
  static String? isMobile(
      {required String? value, int? minLength, int? maxLength}) {
    if ((value ?? "").isEmpty || value == null) {
      return "Mobile Number is required";
    } else if (value.length > (maxLength ?? 10)) {
      return "Please enter a valid mobile number";
    } else if (value.length < (minLength ?? 10)) {
      return "Please enter a valid mobile number";
    } else if (!RegExp(r'^[6789]\d{9}$').hasMatch(value)) {
      return "Please enter a valid mobile number";
    } else {
      return null;
    }
  }

  static String? isSameAs(
      {required String? value,
      required String? confirmText,
      String? errorText}) {
    if ((value ?? "").isEmpty) {
      return "This field is required";
    } else if (value != confirmText) {
      return errorText ?? "Both field has to be same";
    } else {
      return null;
    }
  }
}
