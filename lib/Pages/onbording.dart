import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:minip/Pages/MyhomePageWelcome.dart';
import 'package:minip/Pages/Welcome.dart';
class onbording extends StatefulWidget {
  const onbording({Key key}) : super(key: key);

  @override
  _onbordingState createState() => _onbordingState();
}

class _onbordingState extends State<onbording> {
  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        color: Color(0xff3937bf),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/marketing1.JPG',),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text('Analysing The User Diets Based On Weight 🧐',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),),
                  SizedBox(height: 10,),
                  Text('Using Machine Learning Model BY Analysing Your Weight Will Provide You Proper Diet Plan',
                    style: TextStyle(color: Colors.white),),
                  SizedBox(
                    height: 50,
                  ),
                  ButtonTheme(
                    height: 50,
                    minWidth: 150,
                    child: MaterialButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Container(
        color: Color(0xff27b56f),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/marketing2.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text('Tips For Celiac Disease patients',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),),
                  SizedBox(height: 10,),
                  Text('Gathering Tips from Different Sources 🌍 And Provide it to new Celiac Diseases Patients To help them New More About The Diet and Diseases',
                    style: TextStyle(color: Colors.white),),
                  SizedBox(
                    height: 50,
                  ),
                  ButtonTheme(
                    height: 50,
                    minWidth: 150,
                    child: MaterialButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Container(
        color: Color(0xff0d908b),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/marketing3.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text('find your daily gluten free recipes 🧐',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),),
                  SizedBox(height: 10,),
                  Text('the app will provide different kind of recipes ',
                    style: TextStyle(color: Colors.white),),
                  SizedBox(
                    height: 50,
                  ),
                  ButtonTheme(
                    height: 50,
                    minWidth: 150,
                    child: MaterialButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Container(
        color: Color(0xff441b1b),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/marketing3.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text('Figure out the hidden Gluten 🍲',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),),
                  SizedBox(height: 10,),
                  Text('Get Rid Of Doubts About The Contamination on celaic disease Diets',
                    style: TextStyle(color: Colors.white),),
                  SizedBox(
                    height: 50,
                  ),
                  ButtonTheme(
                    height: 50,
                    minWidth: 150,
                    child: MaterialButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Start',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyhomePageWelcome(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ];
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        positionSlideIcon: 0,
        slideIconWidget: Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: Colors.white,
        ),
      ),

    );
  }
}
