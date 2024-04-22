class OTPVerificationResponse {
  final bool status;
  final String message;
  final Map<String, dynamic> data;

  OTPVerificationResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OTPVerificationResponse.fromJson(Map<String, dynamic> json) {
    return OTPVerificationResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] ?? {},
    );
  }
}
