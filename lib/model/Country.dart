
class Country {
  final int id;
  final String name;
  final String code;
  final String telCode;
  final String flag;
  final String? timezone;
  final String createdAt;
  final String updatedAt;

  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.telCode,
    required this.flag,
    required this.createdAt,
    required this.updatedAt,
    this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      telCode: json['tel_code'],
      flag: json['flag'],
      timezone: json['timezone'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
