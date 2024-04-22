import 'package:assessment/resources/colors.dart';
import 'package:flutter/material.dart';
class CountryListItem extends StatelessWidget {
  final String flagImageUrl;
  final String countryName;
  final String countryCode;
  const CountryListItem({super.key, required this.flagImageUrl, required this.countryName, required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        flagImageUrl,
        width: 36,
        height: 24,
        fit: BoxFit.cover,
      ),
      title: Text(
        countryName,
        style: TextStyle(fontSize: 18,color: AppColors.textMain),
      ),
      trailing: Text(
        countryCode,
        style: TextStyle(fontSize: 14,color: AppColors.textMain),
      ),
    );
  }
}
