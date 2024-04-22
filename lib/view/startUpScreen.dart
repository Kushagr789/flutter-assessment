import 'package:Kushagra/data/data.dart';
import 'package:Kushagra/resources/colors.dart';
import 'package:Kushagra/resources/components/roleWidget.dart';
import 'package:Kushagra/view/searchCountry.dart';
import 'package:Kushagra/view/tnc.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StartUpScreen extends StatelessWidget {
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height*1,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height*0.9,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/start.png"),fit: BoxFit.cover)
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: size.height*0.4,
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(color: Color.fromRGBO(255, 255, 255, 0.5),spreadRadius: 10,blurRadius: 26),

                  ]
                ),
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Welcome to Study Lancer",style: TextStyle(color: AppColors.textMain,fontSize: 24,fontWeight: FontWeight.w600),),
                    const Text("Please select your role to get registered",style: TextStyle(color: AppColors.textMain,fontSize: 14,fontWeight: FontWeight.w400),),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoleBox(title: 'Student', image: "assets/images/student.png", onPress: (){
                            Data.role="S";
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchCountry()));
                          }),
                          RoleBox(title: 'Agent', image: "assets/images/agent.png", onPress: (){
                            Data.role="A";
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchCountry()));
                          }),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("By continuing you agree to our ",style: TextStyle(color: AppColors.textMain,fontSize: 12,fontWeight: FontWeight.w400),),
                        InkWell(
                          child: Text("Terms and Conditions",style: TextStyle(color: AppColors.textRed,fontSize: 12,fontWeight: FontWeight.w600),),
                          onTap: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> TC()));
                          },
                        )
                      ],
                    )

                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
