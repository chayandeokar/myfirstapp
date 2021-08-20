import 'dart:convert';

import 'package:http/http.dart' as http;

String api='9d77ff79-019f-11ec-a13b-0200cd936042';

class OTP{

  Future<void> sendOTP(String mobile,int otp)async{
  //String url='https://2factor.in/API/V1/$api/SMS/$mobile/AUTOGEN';
  String url='https://2factor.in/API/V1/$api/SMS/$mobile/$otp';
  
    var response=await http.get(Uri.parse(url));
   print(response.body);
 
      }
}
