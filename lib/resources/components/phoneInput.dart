import 'package:Kushagra/data/data.dart';
import 'package:Kushagra/resources/colors.dart';
import 'package:Kushagra/resources/components/phoneInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class PhoneInput extends StatefulWidget {
  const PhoneInput({super.key});
  static bool valid=false;
  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(

      color: AppColors.main,
      width: size.width*0.75,
      height: 70,
      child: TextField(
        controller: _phoneController,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.greyCustom),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.greyCustom),
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 35,
                height: 23,
                margin: EdgeInsets.only(left: 25),
                child: SvgPicture.network(
                  fit: BoxFit.cover,
                  Data.flag,
                  placeholderBuilder: (BuildContext context) => Container(
                    child: const CircularProgressIndicator(),
                  ),
                ),
              ),
              SizedBox(width: 25),
              Text(Data.teleCode,style: TextStyle(color: AppColors.textMain,fontSize: 18,fontWeight: FontWeight.w500),), // Your prefix text
              SizedBox(width: 15), // Adjust the spacing between icon and text
            ],
          ),
          hintText: "9999999999",
          hintStyle: TextStyle(color: AppColors.greyCustom,fontSize: 18,fontWeight: FontWeight.w500),
        ),
        keyboardType: TextInputType.phone,
        style: TextStyle(color: AppColors.textMain,fontSize: 18,fontWeight: FontWeight.w500) ,
        onChanged: (value){
          if(value.length==10&& _validatePhoneNumber(value)){
            PhoneInput.valid=true;
            Data.phone=value;
          }else{
            PhoneInput.valid=false;
          }
          setState(() {

          });
        },
      ),
    );
  }
  bool _validatePhoneNumber(String phoneNumber) {

    RegExp regExp = RegExp(r'^\+?0*[1-9][0-9]{9}$');
    return regExp.hasMatch(phoneNumber);
  }
}
