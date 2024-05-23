import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:paitent_registration/api_services/urls.dart';

import '../registration/registration_model.dart';

class ApiServices {
  static printResponse(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameter,
      required http.Response response}) {
    if (kDebugMode) {
      print(Uri.https(AppUrls.base, url, queryParameter ?? {}));
      if (body != null) {
        log("${Uri.https(AppUrls.base, url)}====>$body");
      }
      log("${Uri.https(AppUrls.base, url)}====>${response.statusCode}");
      log("${Uri.https(AppUrls.base, url)}====>${response.body}");
    }
  }

  static Future<GetGenderResponseModel> getGenders() async {
    var response = await http.get(Uri.https(AppUrls.base, AppUrls.gender));
    printResponse(
      url: AppUrls.gender,
      response: response,
    );

    if (response.statusCode == 200) {
      return getGenderResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetMaritalStatusResponseModel> getMaritalStatus() async {
    var response =
        await http.get(Uri.https(AppUrls.base, AppUrls.maritalStatus));
    printResponse(
      url: AppUrls.maritalStatus,
      response: response,
    );

    if (response.statusCode == 200) {
      return getMaritalStatusResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetBloodGroupResponseModel> getBloodGroup() async {
    var response = await http.get(Uri.https(AppUrls.base, AppUrls.bloodGroup));
    printResponse(
      url: AppUrls.bloodGroup,
      response: response,
    );

    if (response.statusCode == 200) {
      return getBloodGroupResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<RegistrationResponseModel> register(
      {required Map<String, dynamic> body}) async {
    var response = await http.post(Uri.https(AppUrls.base, AppUrls.register),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));
    printResponse(url: AppUrls.register, response: response, body: body);

    if (response.statusCode == 200) {
      return registrationResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }
}
