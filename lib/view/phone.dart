import 'package:assessment/data/data.dart';
import 'package:assessment/resources/colors.dart';
import 'package:assessment/resources/components/backButton.dart';
import 'package:assessment/resources/components/phoneInput.dart';
import 'package:assessment/resources/components/roundButton.dart';
import 'package:assessment/view/verify.dart';
import 'package:assessment/view_model/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class PhoneNumScreen extends StatefulWidget {
  const PhoneNumScreen({super.key});

  @override
  State<PhoneNumScreen> createState() => _PhoneNumScreenState();
}

class _PhoneNumScreenState extends State<PhoneNumScreen> {
  bool valid=true;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: 50),
            color: AppColors.main,
            width: double.infinity,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  color: AppColors.main,
                  elevation: 4,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 30,right: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BackButtonCustom(),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("Enter phone number",style: TextStyle(color: AppColors.textMain,fontSize: 24),),
                        SizedBox(height: 20,),
                        Text("Please enter your 10 digit mobile\n number to receive OTP",style: TextStyle(color: AppColors.textRed,fontSize: 14,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50,),
        
                PhoneInput(),
                (!valid)?Text("Please enter a valid mobile number",style: TextStyle(color: Color.fromRGBO(240, 82, 82, 1),fontSize: 14,fontWeight: FontWeight.w400),):SizedBox(),
                SizedBox(height: 250,),
                RoundButton(title: "Get OTP", status: valid, onPress: (){
                  if(PhoneInput.valid){
                    print(PhoneInput.valid);
                    valid=true;
                    final viewModel = Provider.of<LoginViewModel>(context,listen: false);
                    viewModel.sendOTP(Data.teleCode, Data.phone).then((value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify()));
                    }).onError((error, stackTrace) {
                      print(error.toString());
                    });
        
                  }
                  else{
                    valid=false;
                  }
                  setState(() {
        
                  });
        
                }),
        
        
        
              ],
            )
        ),
      ),
    );
  }
}
