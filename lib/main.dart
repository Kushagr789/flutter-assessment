import 'package:Kushagra/view/startUpScreen.dart';
import 'package:Kushagra/view_model/CountryViewModel.dart';
import 'package:Kushagra/view_model/OtpVerifyViewModel.dart';
import 'package:Kushagra/view_model/ResendOtpViewModel.dart';
import 'package:Kushagra/view_model/SelectCountryViewModel.dart';
import 'package:Kushagra/view_model/TimerProvider.dart';
import 'package:Kushagra/view_model/loginViewModel.dart';
import 'package:Kushagra/view_model/tncViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> CountryViewModel()),
      ChangeNotifierProvider(create: (_)=>TermsAndConditionsViewModel()),
      ChangeNotifierProvider(create: (_)=>LoginViewModel()),
      ChangeNotifierProvider(create: (_)=>OTPVerificationViewModel()),
      ChangeNotifierProvider(create: (_)=>TimerModel()),
      ChangeNotifierProvider(create: (_)=>ResendOtpViewModel()),
      ChangeNotifierProvider(create: (_)=>SelectCountryViewModel())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Metropolis',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const StartUpScreen(),
    ),);
  }
}

