import 'dart:convert';
import 'package:Kushagra/data/data.dart';
import 'package:Kushagra/resources/app_urls.dart';
import 'package:Kushagra/service/apiServices.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OTPVerificationViewModel extends ChangeNotifier {
  final ApiServices _apiService = ApiServices();

  String phoneNumber = Data.teleCode+Data.phone;
  String otp = '';
  bool isLoading = false;
  String errorMessage = '';
  bool isOTPVerified = false;
  String accessToken = '';


  Future<void> verifyOTP() async {
    isLoading = true;
    phoneNumber=Data.teleCode+Data.phone;
    errorMessage = '';
    notifyListeners();




    try {
      final response = await http.post(
        Uri.parse(AppUrl.verifyOtpUrl),
        headers: {'Accept': 'application/json'},
        body: json.encode({'code': otp, 'phone': phoneNumber}),
      );

      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200 && responseData['status']) {
        isOTPVerified = true;
        accessToken = responseData['data']['access_token'];
        Data.token=accessToken;
      } else {
        errorMessage = responseData['message'] ?? 'Failed to verify OTP';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    }

    isLoading = false;
    notifyListeners();
  }

  bool isInputValid() {
    return phoneNumber.isNotEmpty && otp.isNotEmpty && otp.length==6;
  }


  void updateOTP(String value) {
    otp = value;
    notifyListeners();
  }
}
