class ResendOtpModel {
  final bool status;
  final String message;
  final Map<String, dynamic> data;

  ResendOtpModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResendOtpModel.fromJson(Map<String, dynamic> json) {
    return ResendOtpModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] ?? {},
    );
  }
}
