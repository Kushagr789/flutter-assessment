import 'package:assessment/resources/colors.dart';
import 'package:flutter/material.dart';
class CrossButton extends StatelessWidget {
  const CrossButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        width: 30,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.backButton,
            boxShadow: [
              BoxShadow(color: Color.fromRGBO(189, 189, 189, 0.3),offset: Offset(-4,-3),spreadRadius: 0,blurRadius: 10),
              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.36),offset: Offset(8,5),spreadRadius: 0,blurRadius: 10),
            ]
        ),
        child: Center(child: Icon(Icons.close,color: AppColors.textMain,size: 18,),),
      ),
    );
  }
}
