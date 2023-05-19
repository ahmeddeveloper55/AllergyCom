import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:minip/Pages/Welcome.dart';

import 'otp_verify_page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
   String _otp;

  Future<void> _sendOTP(String phoneNumber) async {
    final url =
        'https://welectric-core-api.azurewebsites.net/api/generate-otp?code=uYr3wiV3CBxdTf1aEr4UWO299ShhOc-cOILWNT5vzVWBAzFuKMjIJA==';
    final body = jsonEncode({
      'key': phoneNumber,
      'channel': 'SMS',
      'otp': '',
    });
    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'}, body: body);
    final data = jsonDecode(response.body);
    setState(() {
      _otp = data['otp'];
    });
  }

  void _submitPhoneNumber() {
    if (_formKey.currentState?.validate()??true) {
      final phoneNumber = _phoneNumberController.text.trim();
      _sendOTP(phoneNumber);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPVerifyPage(phoneNumber: phoneNumber,),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 35),
                      child: Image.asset(
                        "assets/PROJECT_ACOM.png",
                        height: 150,

                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text("Login By Phone Number" , style: TextStyle(fontSize : 20 , fontWeight: FontWeight.w700),),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your 10-digit phone number',
                    ),
                    validator: (value) {
                      if (value?.isEmpty?? true) {
                        return 'Please enter your phone number';
                      } else if (value?.length != 10) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.deepPurple,
                      ),
                      onPressed: _submitPhoneNumber,
                      child: Text('Submit'),
                    ),
                  ),
                  SizedBox(height: 4,),
                  TextButton(onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome())), child: Text("Click Here to Register.", style: TextStyle(fontSize: 13,color: Colors.deepPurple),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
