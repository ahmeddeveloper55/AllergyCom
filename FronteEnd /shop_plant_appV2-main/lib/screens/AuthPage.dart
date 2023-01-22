import 'package:flutter/material.dart';
import 'package:plant_appui/screens/login.dart';
import 'package:plant_appui/screens/registerPage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _showloginPage = true;
  void toggleBetweenTheScreen() {
    setState(() {
      _showloginPage = !_showloginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showloginPage) {
      return longin(registerPage: toggleBetweenTheScreen);
    } else {
      return registerPage(showLogin: toggleBetweenTheScreen);
    }
  }
}
