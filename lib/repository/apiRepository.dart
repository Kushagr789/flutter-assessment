
import 'package:assessment/resources/app_urls.dart';
import 'package:assessment/service/apiServices.dart';
import 'package:assessment/service/baseApiServices.dart';

class ApiRepository{
  BaseApiServices _apiServices= ApiServices();
  Future<dynamic> tncApi()async{
    try{
      dynamic response=await _apiServices.getGetApiResponse(AppUrl.tncUrl);
      return response;
    }catch(e)
    {
      throw e;
    }
  }
  
}