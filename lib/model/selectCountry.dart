class SelectCountry {
  final int id;
  final String name;
  final String flag;
  final String image;

  SelectCountry({
    required this.id,
    required this.name,
    required this.flag,
    required this.image,
  });

  factory SelectCountry.fromJson(Map<String, dynamic> json) {
    return SelectCountry(
      id: json['id'],
      name: json['name'],
      flag: json['flag'],
      image: json['image'],
    );
  }
}
