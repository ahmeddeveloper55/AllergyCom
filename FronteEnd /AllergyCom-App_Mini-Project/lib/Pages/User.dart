import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:minip/model/nutrient.dart';

class User extends StatefulWidget {
  final age;
  final height;
  final weight;
  final gender;
  final pref;

  const User({Key key,@required this.age,@required this.height,@required this.weight,@required this.gender,@required this.pref}) : super(key: key);


  @override
  _UserState createState() => _UserState();
}


class _UserState extends State<User> {


  static List<Nutrient> _userDetails = [];
  static List<String> mealType = ["Breakfast","Lunch","Dinner"];
  final uri = 'https://nin-api.herokuapp.com/19/M/ASH';


  Future<Null> getUser() async {
    final response = await http.get(Uri.parse('https://allergycomm.herokuapp.com/${widget.age}/${widget.gender}/${widget.weight}'));

    final responseJson = json.decode(response.body);
    setState(() {
      for (Map user in responseJson) {
        _userDetails.add(Nutrient.fromJson(user));
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if(!_userDetails.isEmpty){
      _userDetails.clear();
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child : new ListView.builder(
            itemCount: _userDetails.length,
            itemBuilder: (context, i) {
              return Card(
                margin: EdgeInsets.all(12.0),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                 child : Column(
                      children: [
                        Text(mealType[i].toString() + ":" , style: GoogleFonts.acme(
                            textStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black54,
                              fontFamily: 'Pacifico',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.3,
                            )),),
                        SizedBox(width: 5.0,),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_userDetails[i].prediction.toString(),style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              fontSize: 15.0
                            ),),
                          ),
                          dense: true,
                        ),
                      ],
                    ),
                  ),

              );
            }),

      ),

    );
  }
}


