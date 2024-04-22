import 'dart:convert';

import 'package:assessment/model/TncModel.dart';
import 'package:assessment/resources/app_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class TermsAndConditionsViewModel extends ChangeNotifier {
  TermsAndConditions? _privacyPolicy;

  TermsAndConditions? get privacyPolicy => _privacyPolicy;

  Future<void> fetchPrivacyPolicy() async {

    final response = await http.get(Uri.parse(AppUrl.tncUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _privacyPolicy = TermsAndConditions.fromJson(jsonData['data']);

      notifyListeners();
    } else {
      throw Exception('Failed to load privacy policy');
    }
  }
}
