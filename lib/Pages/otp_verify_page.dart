import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minip/Pages/MyhomePageWelcome.dart';
import 'package:pinput/pinput.dart';

import 'package:sms_autofill/sms_autofill.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:http/http.dart' as http;



class OTPVerifyPage extends StatefulWidget {

  static bool isValid;
  final phoneNumber;
  const OTPVerifyPage({Key key, this.phoneNumber}) : super(key: key);

  @override
  _OTPVerifyPageState createState() => _OTPVerifyPageState();
}

class _OTPVerifyPageState extends State<OTPVerifyPage> {
  int _secondsRemaining = 60 * 3;
  String buttonName = "Resend OTP";
  bool _showTimer = true;
  bool enableResendBtn = false;
  String _otpCode = "";
  String smsCode = "";

  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  bool _isValid = false;
  final int _otpCodeLength = 4;
  bool _enableButton = false;
  var autoFill;
   FocusNode myFocusNode;
  bool isAPIcallProcess = false;



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
      smsCode = data['otp'];
    });
  }

  void startTimer() {
    setState(() {
      _secondsRemaining = 3 * 60;
      buttonName = 'Resend OTP';
    });

    final timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (_secondsRemaining < 1) {
          t.cancel();
        } else {
          _secondsRemaining--;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    startTimer();
    myFocusNode.requestFocus();
    SmsAutoFill().listenForCode.call();
  }

  Future<void> _validateOTP(String otp) async {
    final url =
        'https://welectric-core-api.azurewebsites.net/api/validate-otp?code=uYr3wiV3CBxdTf1aEr4UWO299ShhOc-cOILWNT5vzVWBAzFuKMjIJA==';
    final body = jsonEncode({
      'key': widget.phoneNumber,
      'channel': 'SMS',
      'otp': otp,
    });
    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'}, body: body);
    if (response.statusCode == 200) {
      setState(() {
        _isValid = true;
      });
    } else {
      setState(() {
        _isValid = false;
      });
    }
  }

  void _submitOTP(String Otp) {
    if (_formKey.currentState?.validate() ?? true) {
      _otpCode = Otp;
      _validateOTP(_otpCode);
    }
  }

  String get timerText {
    final minutes = _secondsRemaining ~/ 60;
    final seconds = _secondsRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: otpVerify(),
      ),
    );
  }

  Widget otpVerify() {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.green),
      borderRadius: BorderRadius.circular(8),
    );
    final errorPinTheme = defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration?.copyWith(
          border: Border.all(color: Colors.red), // Change the border color to red
        ));

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.white,
      ),
    );
    WidgetsBinding.instance
        .addPostFrameCallback((_) => myFocusNode.requestFocus());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          "https://i.imgur.com/6aiRpKT.png",
          height: 180,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "We Have Sent a verification Code to \n",
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                        text: "+91 ${widget.phoneNumber}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))
                  ]),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Pinput(
          controller: _otpController,
          defaultPinTheme: _isValid ? defaultPinTheme : errorPinTheme,
          focusedPinTheme: _isValid ? focusedPinTheme : errorPinTheme,
          submittedPinTheme: submittedPinTheme,
          length: 4,
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,

          onTap: () {
            setState(() {
              _otpController.clear();
            });
          },
          //   validator: (value)  {
          //     setState(() {
          //     });
          //     print("check value $value");
          //     print("check _otp $_isValid and $smsCode");
          //     if (_isValid) {
          //       return null; // Return null if the OTP is valid
          //     } else {
          //       return 'Invalid OTP!'; // Return an error message if the OTP is invalid
          //     }
          // },
          onChanged: (value) async {
            if (value.length == 4) {
              setState(() {
                _otpController.text = value;
              });
              await _validateOTP(value);
              print("check value in onchange $value");
              print("check _otp in onchange $_otpCode and $_isValid");
            }
          },
        ),
        SizedBox(height: 16.0),
        _otpCode.isEmpty
            ? const Text(
          '',
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
        )
            : _isValid
            ? const Text(
          '',
          style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
        )
            : const Text(
          'InValid OTP',
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 15.0),
        ),
        SizedBox(height: 16.0),
        const Text(
          "Didn't Receive OTP ? ",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.bold,
              fontSize: 12.0),
        ),
        SizedBox(height: 5.0),
        TextButton(
          onPressed: _secondsRemaining < 1
              ? () {
            _sendOTP(widget.phoneNumber);
            startTimer();
          }
              : null,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  _secondsRemaining < 1
                      ? "Resend OTP"
                      : "Resend OTP in $timerText",
                  style: _secondsRemaining < 1
                      ? const TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.5)
                      : const TextStyle(
                      color: Colors.black12,
                      fontWeight: FontWeight.w800,
                      fontSize: 15.5)),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        /*
         _submitOTP(_otpController.text);
              if (_isValid && _otpController.text == _otpCode) {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: const Text("Congratulations! 🥳"),
                          content: const Text(
                              "Your OTP is correct. Your order is confirmed!"),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                try {
                                  Navigator.pop(context);
                                  Get.offAll(const LeazyCart(isOrderConfirmed: true));

                                } catch (e) {
                                  print("Error executing confirmOrder or userUpdateOrderID: $e");
                                  // Handle the error
                                }
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ));
              }
         */
        Center(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width * 0.7,
            child:  ElevatedButton(
                onPressed: () async {
                  _submitOTP(_otpController.text);
                  if (_isValid && _otpController.text == _otpCode) {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Congratulations! 🥳"),
                          content: const Text(
                              "Your OTP is correct. you can login"),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyhomePageWelcome()));
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.deepPurple,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Verify"),
                )),

          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    myFocusNode.dispose();
    super.dispose();
  }
}