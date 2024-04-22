import 'dart:convert';
import 'dart:io';

import 'package:assessment/data/app_exceptions.dart';
import 'package:assessment/data/data.dart';
import 'package:assessment/model/loginModel.dart';
import 'package:assessment/resources/app_urls.dart';
import 'package:assessment/service/baseApiServices.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
class ApiServices extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
    try{
      final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson=returnResponse(response);
    }on SocketException{
      throw FetchException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async{
    dynamic responseJson;
    try{
      Response response=await post(Uri.parse(url),body: data).timeout(const Duration(seconds: 10));
      responseJson=returnResponse(response);
    }on SocketException{
      throw FetchException("No Internet Connection");
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        final responseJson=jsonEncode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchException("Error occured while communication with server with status code ${response.statusCode.toString()}");
    }
  }


  Future<LoginModel> sendOTP(String telCode, String phoneNumber) async {
    final response = await http.post(
      Uri.parse((Data.role=="A")?AppUrl.agentLoginUrl:AppUrl.studentLoginUrl),
      body: json.encode({'telCode': telCode, 'phoneNumber': phoneNumber}),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return LoginModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to send OTP');
    }
  }


}