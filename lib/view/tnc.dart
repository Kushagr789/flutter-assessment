import 'package:assessment/model/TncModel.dart';
import 'package:assessment/resources/colors.dart';
import 'package:assessment/resources/components/crossButton.dart';
import 'package:assessment/view_model/tncViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';


class TC extends StatefulWidget {
  const TC({super.key});

  @override
  State<TC> createState() => _TCState();
}

class _TCState extends State<TC> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TermsAndConditionsViewModel>(context, listen: false)
          .fetchPrivacyPolicy();
    });
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final viewModel=Provider.of<TermsAndConditionsViewModel>(context);

    return Scaffold(

      body: viewModel.privacyPolicy==null?CircularProgressIndicator():
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10,right: 10,top: 40),
          color: AppColors.main,
          width: double.infinity,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end,children: [CrossButton(),SizedBox(width: 25,)],),
              Container(
                width: double.infinity,
                height: size.height*0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 65,
                      width: 55,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/tnc.png"),fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Terms of Service",style: TextStyle(color: AppColors.textRed,fontSize: 18,fontWeight: FontWeight.w500),),
                        SizedBox(height: 10,),
                        Text("Update 16/03/2023",style: TextStyle(color: AppColors.textLight,fontSize: 14,fontWeight: FontWeight.w400),)

                      ],
                    )
                  ],
                ),
              ),
              Html(data: viewModel.privacyPolicy?.content,style: {
                "h1":Style(fontSize: FontSize.large,fontWeight: FontWeight.w500,color: AppColors.textRed),
                "p":Style(fontSize: FontSize.large,fontWeight: FontWeight.w400,color: AppColors.textMain),
                "li":Style(fontSize: FontSize.large,fontWeight: FontWeight.w400,color: AppColors.textMain),
              },)
            ],
          ),
        ),
      )
    );
  }
}
