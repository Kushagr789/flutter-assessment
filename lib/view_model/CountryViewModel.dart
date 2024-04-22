import 'dart:convert';

import 'package:assessment/model/Country.dart';
import 'package:assessment/resources/app_urls.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class CountryViewModel extends ChangeNotifier{
  List<Country> _countries=[];
  List<Country> _filterCountries=[];
  CountryViewModel(){
    _filterCountries=_countries;
  }
  List<Country> get filterCountries => _filterCountries;
  void search(String query) {
    _filterCountries = _countries
        .where((item) => item.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Future<void> fetchCountries() async{
    final response=await http.get(Uri.parse(AppUrl.countryListUrl));
    if(response.statusCode==200){
      _countries.clear();
      final List<dynamic> data = jsonDecode(response.body)['data'];
      if (kDebugMode) {
        _countries = data.map((json) => Country.fromJson(json)).toList();
        if(_filterCountries.isEmpty)
          _filterCountries=_countries;

      }else{
        throw Exception("exception");
      }
    }else{
      throw Exception("Excpetion");
    }
  }
}