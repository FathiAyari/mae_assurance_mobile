import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mae_assurance_mobile/presentation/ressources/routes/router.dart';
import 'package:mae_assurance_mobile/services/call_api.dart';

import '../models/ApiResponse.dart';
import '../models/User.dart';
import 'api_constants.dart';

class AuthServices {
  void saveUserLocally(User currentUser) {
    var user = GetStorage();
    user.write('user', currentUser.toJson());
    user.write("auth", 1);
  }

  Future<ApiResponse> SignUp({required User user}) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      print(token);
      Map<String, dynamic> data = user.toJson();
      data['token'] = token;
      var body = jsonEncode(data);
      http.Response response = await CallApi().postData(ApiConstants.register, body);
      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        User user = User.fromJson(result);
        saveUserLocally(user);
        apiResponse.responseStatus = true;
      } else {
        apiResponse.responseMessage = result['message'];
        apiResponse.responseStatus = false;
      }
      return apiResponse;
    } catch (e) {
      apiResponse.responseMessage = e.toString();

      apiResponse.responseStatus = false;
      return apiResponse;
    }
  }

  Future<ApiResponse> SignIn({required User user}) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      String? token = await FirebaseMessaging.instance.getToken();

      Map<String, dynamic> data = user.toJson();
      data['token'] = token;
      var body = jsonEncode(data);

      http.Response response = await CallApi().postData(ApiConstants.login, body);
      var result = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        User user = User.fromJson(result);
        saveUserLocally(user);
        apiResponse.responseStatus = true;
        apiResponse.responseMessage = user.status! ? "active" : "inactive";
      } else {
        apiResponse.responseMessage = result['message'];
        apiResponse.responseStatus = false;
      }
      return apiResponse;
    } catch (e) {
      print(e.toString());
      apiResponse.responseStatus = false;
      apiResponse.responseMessage = e.toString();
      return apiResponse;
    }
  }

  Future<ApiResponse> checkAccountStatus({required int id}) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      http.Response response = await CallApi().getData(ApiConstants.checkStatus + '/${id}');
      var result = jsonDecode(response.body);
      print(result['status']);
      apiResponse.responseMessage = result['status'];
      return apiResponse;
    } catch (e) {
      apiResponse.responseMessage = e.toString();

      apiResponse.responseStatus = false;
      return apiResponse;
    }
  }

  logOut(BuildContext context) {
    GetStorage().remove("user");
    GetStorage().remove("auth");
    Get.toNamed(AppRouting.signIn);
  }
}
