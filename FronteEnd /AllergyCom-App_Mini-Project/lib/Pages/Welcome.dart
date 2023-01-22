import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minip/Pages/MianPage.dart';
import 'package:minip/Widgets/constants.dart';
import 'dart:convert';
import 'package:minip/Pages/User.dart';
import 'package:http/http.dart' as http;

class Welcome extends StatefulWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

enum Gender { male, female }

class _WelcomeState extends State<Welcome> {
  Gender _selectGender = Gender.male;
  int age = 0;
  int height = 2;
  int weight = 3;
  var pref = "";
  var genderEdit = '';
  var male1 = 'M';
  String Female = 'F';

  final keys = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    if (_selectGender == Gender.male) {
      male1 = "M";
    } else {
      Female = "F";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to AllergyCom App",
              style: GoogleFonts.aldrich(
                  textStyle: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Palatino',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                  )),
            ),
            SizedBox(
              height: height / 35,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_selectGender == Gender.male) {
                      genderEdit = "M";
                    } else {
                      genderEdit = "F";
                    }
                    setState(() {
                      _selectGender = Gender.male;
                    });
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Card(
                      color: _selectGender == Gender.male
                          ? ActiveColor
                          : InActiveColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                              image: AssetImage(
                                'assets/icons8-collaborator-male-80.png',
                              )),
                          Text('${this.male1}'),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_selectGender == Gender.female) {
                      genderEdit = "M";
                    } else {
                      genderEdit = "F";
                    }
                    setState(() {
                      _selectGender = Gender.female;
                    });
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Card(
                      color: _selectGender == Gender.female
                          ? ActiveColor
                          : InActiveColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                              image: AssetImage(
                                'assets/icons8-pupil-female-64.png',
                              )),
                          Text('${this.Female}'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 35,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: TextFormField(
                onChanged: (text) {
                  this.age = int.parse(text);
                  setState(() {
                    print('${this.age.toString()}');
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter your Age : ",
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
                  labelText: "Age",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  // contentPadding:
                ),
              ),
            ),
            SizedBox(
              height: height / 45,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  this.height = int.parse(text);
                  setState(() {
                    print('$text');
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
                  hintText: "Enter your Height : ",
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),

                  labelText: "Height",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  // contentPadding:
                ),
              ),
            ),
            SizedBox(
              height: height / 45,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: TextFormField(
                onChanged: (text) {
                  this.weight = int.parse(text);
                  setState(() {
                    print('$text');
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
                  hintText: "Enter your weight : ",
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                  labelText: "weight",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  // contentPadding:
                ),
              ),
            ),
            // SizedBox(
            //   height: height / 45,
            //   width: double.infinity,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            //   child: TextFormField(
            //     keyboardType: TextInputType.text,
            //     onChanged: (text) {
            //       this.pref = text;
            //       setState(() {
            //         print('$text');
            //       });
            //     },
            //     decoration: InputDecoration(
            //       contentPadding:
            //       EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
            //       hintText: "Enter your Preference : ",
            //       hintStyle: TextStyle(
            //         fontStyle: FontStyle.italic,
            //         fontWeight: FontWeight.w500,
            //       ),
            //
            //       labelText: "Preference",
            //       labelStyle: TextStyle(
            //         fontStyle: FontStyle.normal,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(11.0),
            //       ),
            //       // contentPadding:
            //     ),
            //   ),
            // ),
            SizedBox(
              height: height / 45,
              width: double.infinity,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(
                      age: this.age.toString(),
                      height: this.height,
                      weight: this.weight,
                      gender: this.genderEdit,
                      pref: this.pref,
                    ),
                  ),
                );
              },
              color: Theme.of(context).colorScheme.background,
              child: Text("submit"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              minWidth: width / 1.28,
            ),
          ],
        ),
      ),
    );
  }

}
