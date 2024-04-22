import 'package:assessment/view/startUpScreen.dart';
import 'package:assessment/view_model/CountryViewModel.dart';
import 'package:assessment/view_model/OtpVerifyViewModel.dart';
import 'package:assessment/view_model/TimerProvider.dart';
import 'package:assessment/view_model/loginViewModel.dart';
import 'package:assessment/view_model/tncViewModel.dart';
import 'package:flutter/material.dart';
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
      ChangeNotifierProvider(create: (_)=>TimerModel())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const StartUpScreen(),
    ),);
  }
}

