import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_appui/screens/MainPage.dart';
import 'package:plant_appui/screens/home_page.dart';
import 'package:plant_appui/screens/login.dart';

import 'package:provider/provider.dart';

import 'Provider/floweringProvider.dart';
import 'Provider/greenProvider.dart';
import 'Provider/indoorProvider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization= Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => greenProvider()),
        ChangeNotifierProvider(create: (context) => indoorProvider()),
        ChangeNotifierProvider(create: (context) => floweringProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
        theme: ThemeData(
          primaryColor: Color(0xff67864A),
        ),
      ),
    );
  }
}
