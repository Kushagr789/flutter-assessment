import 'dart:convert';
import 'package:assessment/model/selectCountry.dart';
import 'package:assessment/resources/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SelectCountryViewModel extends ChangeNotifier {
  List<SelectCountry> countries = [];

  Future<void> fetchCountries() async {
    final response = await http.get(Uri.parse(AppUrl.selectCountryUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> countryData = jsonData['data']['countries'];
      countries = countryData.map((json) => SelectCountry.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
