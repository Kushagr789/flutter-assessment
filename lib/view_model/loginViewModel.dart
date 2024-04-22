

import 'package:Kushagra/service/apiServices.dart';
import 'package:flutter/material.dart';


class LoginViewModel extends ChangeNotifier {
  final ApiServices _apiService = ApiServices();

  Future<void> sendOTP(String telCode, String phoneNumber) async {
    try {
      final response = await _apiService.sendOTP(telCode, phoneNumber);
      if (response.status) {
        print("Succes");
      } else {
        print("Unsucces");
        }
    } catch (e) {
      print("Error"+e.toString());
      }
  }


}
