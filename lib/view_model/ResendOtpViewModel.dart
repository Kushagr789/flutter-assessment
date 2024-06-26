import 'dart:convert';

import 'package:Kushagra/data/data.dart';
import 'package:Kushagra/model/resendOtp.dart';
import 'package:Kushagra/resources/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResendOtpViewModel extends ChangeNotifier {
  Future<ResendOtpModel> resendOTP() async {
    final headers={'Accept': 'application/json'};
    final body = jsonEncode({'phone_number': Data.teleCode+Data.phone});

    try {
      final response = await http.post(Uri.parse(AppUrl.resendOtpUrl), headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final otpResponse = ResendOtpModel.fromJson(responseData);
        return otpResponse;
      } else {
        throw Exception('Failed to resend OTP');
      }
    } catch (e) {
      throw Exception('Failed to resend OTP: $e');
    }
  }
}
