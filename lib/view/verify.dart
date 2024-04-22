import 'package:assessment/resources/colors.dart';
import 'package:assessment/resources/components/backButton.dart';
import 'package:assessment/resources/components/otpInput.dart';
import 'package:assessment/resources/components/roundButton.dart';
import 'package:assessment/view/selectCountry.dart';
import 'package:assessment/view_model/OtpVerifyViewModel.dart';
import 'package:assessment/view_model/ResendOtpViewModel.dart';
import 'package:assessment/view_model/TimerProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OTPVerificationViewModel>(context);
    bool error=false;

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
                        Text("Verify Number",style: TextStyle(color: AppColors.textMain,fontSize: 24),),
                        SizedBox(height: 20,),
                        Text("Please enter the OTP recieved to\n verify your number",style: TextStyle(color: AppColors.textRed,fontSize: 14,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
        
                SizedBox(height: 50,),
                OtpInput(),
                error==true?Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(child: Text("OTP does not match, please try again",style: TextStyle(color: Color.fromRGBO(240, 82, 82, 1),fontSize: 14,fontWeight: FontWeight.w400),),),
                ):SizedBox(height: 50),
                Text("Didn't recieve OTP?",style: TextStyle(color: AppColors.textLight,fontSize: 14,fontWeight: FontWeight.w400),),
                SizedBox(height: 20,),
                Consumer<TimerModel>(
                  builder: (context,timerModel,child){
        
                    if(timerModel.secondsLeft==0){
                      return InkWell(
                          onTap: (){
                            final resend=Provider.of<ResendOtpViewModel>(context);
                            resend.resendOTP();
                          },
                          child: Text("Resend OTP",style: TextStyle(color: AppColors.textRed,fontSize: 18,fontWeight: FontWeight.w600),));
                  }else{
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Resending OTP in ",style: TextStyle(color: AppColors.textLight,fontSize: 14,fontWeight: FontWeight.w400),),
                          Text(timerModel.secondsLeft.toString()+" seconds",style: TextStyle(color: AppColors.textRed,fontSize: 18,fontWeight: FontWeight.w600),)
        
                    ],
                      );
                    }
        
                  },
                ),
                SizedBox(height: 70,),
                RoundButton(title: "Verify", status: true, onPress: (){
                  if (viewModel.isInputValid()) {
                    viewModel.verifyOTP().then((value) {
                      error=false;
        
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectCountry()));
                    });
                  } else {
                    error=true;
        
        
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
