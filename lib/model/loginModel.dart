class LoginModel {
  final bool status;
  final String message;
  final Map<String, dynamic> data;

  LoginModel({required this.status, required this.message, required this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}
