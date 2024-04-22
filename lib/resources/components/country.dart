import 'package:Kushagra/resources/colors.dart';
import 'package:flutter/material.dart';
class CountryBox extends StatelessWidget {
  const CountryBox({super.key, required this.title, required this.image, required this.status, required this.onPress});
  final String title;
  final String image;
  final bool status;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image.toString()),fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(title.toString(),style: TextStyle(color: status?AppColors.textMain:AppColors.textLight,fontSize: 18,),textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
