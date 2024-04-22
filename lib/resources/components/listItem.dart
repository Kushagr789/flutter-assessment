import 'package:assessment/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class ListItem extends StatelessWidget {
  final String flagUrl;
  final String name;
  final String code;
  const ListItem({super.key, required this.flagUrl, required this.name, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2,top: 2),
      height: 80,
      width: double.infinity,
      child: Material(
        elevation: 1,
        color: AppColors.main,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20,),
            Container(
              width: 36,
              height: 24,
              child: SvgPicture.network(
                fit: BoxFit.cover,
                flagUrl,
                placeholderBuilder: (BuildContext context) => Container(
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name,style: TextStyle(color: AppColors.textMain,fontSize: 18,fontWeight: FontWeight.w500),softWrap: true,maxLines: 2,),
                Text(code,style: TextStyle(color: AppColors.textMain,fontSize: 18,fontWeight: FontWeight.w500),),
              ],
            )),
            SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }
}
