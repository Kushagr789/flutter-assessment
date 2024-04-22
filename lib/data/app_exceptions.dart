class AppException implements Exception{
  final _prefix;
  final _message;
  AppException([this._message,this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }
}

class FetchException extends AppException{
  FetchException([String? message]): super(message,'Error during Communication');
}

class BadRequestException extends AppException{
  BadRequestException([String? message]): super(message,'Invalid request');
}
class UnAuthorizedException extends AppException{
  UnAuthorizedException([String? message]): super(message,'UnAuthorized request');
}
class InvalidInputException extends AppException{
  InvalidInputException([String? message]): super(message,'Invalid input');
}