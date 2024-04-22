import 'package:Kushagra/resources/colors.dart';
import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  final String title;
  final bool status;
  final VoidCallback onPress;
  const RoundButton({super.key, required this.title, required this.status, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        width: size.width*0.5,
        height: size.height*0.08,
        decoration: BoxDecoration(
          color:AppColors.main,
          gradient: LinearGradient(
            colors: status?[
              Color.fromRGBO(0, 0, 0, 0),
              Color.fromRGBO(0, 0, 0, 0.12),
            ]:[
              Color.fromRGBO(0, 0, 0, 0.12),
              Color.fromRGBO(0, 0, 0, 0),

            ]
          ),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: status?Color.fromRGBO(0, 0, 0, 0.08):Color.fromRGBO(255, 255, 255, 0.02),width: 2),
            boxShadow: [
              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.16),offset: Offset(6,6),spreadRadius: 0,blurRadius: 12),
              BoxShadow(color: Color.fromRGBO(255, 255, 255, 0.04),offset: Offset(-6,-6),spreadRadius: 0,blurRadius: 12),
            ]
        ),
        child: Center(
          child: Text(title.toString(),
            style: TextStyle(
              color: status?AppColors.buttonTextActive:AppColors.buttonTextInactive,
              fontSize: 18,
            ),
          ),
        ),
      ),
      onTap: onPress,
    );
  }
}
