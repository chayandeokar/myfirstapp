
// ignore_for_file: prefer_const_constructors


import 'package:homepage/otpmodel.dart';
import 'package:homepage/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:homepage/welcome.dart';
enum MobileVerificationState {
  // ignore: constant_identifier_names
  SHOW_MOBILE_FORM_STATE,
  // ignore: constant_identifier_names
  SHOW_OTP_FORM_STATE,
}

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;

       final phoneController = TextEditingController();
       final otpController = TextEditingController();
       bool showLoading=false;
      late  int otp;
          
  getMobileFormWidget( context) {
     return Column(
      children: [
        Spacer(),
        TextField(
          controller: phoneController,
          decoration: InputDecoration(
            hintText: "Phone Number",
          ),
        ),
        SizedBox(height: 16,
        ),
        FlatButton(
          onPressed: () async{
          print('send pressed');
          setState(() {
            showLoading=true;
          });
          otp=123456; 
            await OTP().sendOTP(phoneController.text,otp
            );
            print('showing otp screen');
            
                setState((){
                  showLoading=false;
                  currentState=MobileVerificationState.SHOW_OTP_FORM_STATE;
                });
            
          } ,
          child: Text("SEND"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
     );
  }

   getOtpFormWidget( context) {
      return Column(
      children: [
        Spacer(),
        TextField(
          controller: otpController,
          decoration: InputDecoration(
            hintText: "Enter OTP",
          ),
        ),
        SizedBox(
          height: 16,
        ), 
        FlatButton(
          onPressed: () 
          {
            print('verified pressed');
            if(otpController.text==otp.toString()){
              print('otp verifed');
              Navigator.push(context,MaterialPageRoute(builder: (_)=>HomePage()));

            }
          } ,
          child: Text("VERIFY"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );

   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:(showLoading)?Center(child: CircularProgressIndicator())
      :Container (
         child: currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
                  padding: const EdgeInsets.all(16),
    )
       );
  }
}


 