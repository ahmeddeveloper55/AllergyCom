import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/BottomButtonBar.dart';
import 'CalorieTrackerPage.dart';
import 'CommunityBlockChain.dart';
import 'Welcome.dart';
class MyhomePageWelcome extends StatefulWidget {
  const MyhomePageWelcome({Key key}) : super(key: key);

  @override
  State<MyhomePageWelcome> createState() => _MyhomePageWelcomeState();
}

class _MyhomePageWelcomeState extends State<MyhomePageWelcome> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    CommunityBlockChain(),
    Welcome(),
    CalorieTrackerPage(),
  ];
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  _pages[_currentIndex],
      bottomNavigationBar: BottomButtonBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );



  }
}
