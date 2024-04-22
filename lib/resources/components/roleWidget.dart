import 'package:assessment/resources/colors.dart';
import 'package:flutter/material.dart';
class RoleBox extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onPress;
  const RoleBox({super.key, required this.title, required this.image, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      height: size.height*0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Container(
              height: size.height*0.16,
              width: size.width*0.42,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image.toString()),fit: BoxFit.cover
                ),
                color: Color.fromRGBO(41, 74, 145, 1),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(40, 55, 69, 1),
                    Color.fromRGBO(0, 0, 0, 0),
                  ]
                ),
                borderRadius: BorderRadius.all(Radius.circular(17)),
                border: Border.all(color: AppColors.border,width: 5,strokeAlign: BorderSide.strokeAlignInside),
                boxShadow: [
                  BoxShadow(color: AppColors.shadow1,offset: Offset(-5,-6),spreadRadius: 0,blurRadius: 14),
                  BoxShadow(color: AppColors.shadow2,offset: Offset(8,18),spreadRadius: 0,blurRadius: 18),
                ]
              ),
            ),
            onTap: onPress,
          ),
          SizedBox(height: 5,),
          Text(title.toString(),style: TextStyle(color: AppColors.textMain,fontSize: 14,fontWeight: FontWeight.w600),)
        ],
      ),

    );
  }
}
