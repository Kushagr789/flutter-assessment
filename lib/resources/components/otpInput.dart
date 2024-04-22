import 'package:assessment/resources/colors.dart';
import 'package:assessment/view_model/OtpVerifyViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class OtpInput extends StatefulWidget {
  const OtpInput({super.key});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  List<TextEditingController> _controllers = List.generate(
      6, (index) => TextEditingController(text: ''));

  void verify(){

}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) => SizedBox(
                    width: 40,
                    height: 40,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (index < 5) {
                            _focusNodes[index + 1].requestFocus();
                          }
                        } else {
                          if (index > 0) {
                            _focusNodes[index - 1].requestFocus();
                          }
                        }
                        String otp="";
                        for (int i = 0; i < 6; i++) {
                          otp += _controllers[i].text;
                        }

                        final viewModel=Provider.of<OTPVerificationViewModel>(context);
                        viewModel.updateOTP(otp);
                      },
                      style: TextStyle(color: AppColors.textMain,fontSize: 18,fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greyCustom),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greyCustom),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

             // ElevatedButton(
               // onPressed: () {
                 // String otp = '';
                 //
                  //print('OTP Entered: $otp');
                  // Here you can validate or process the OTP
                //},
                //child: Text('Submit'),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
