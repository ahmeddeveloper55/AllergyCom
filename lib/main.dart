import 'package:flutter/material.dart';
import 'package:minip/Pages/onbording.dart';
import 'package:minip/providers/FoodAdditiveProvider.dart';
import 'package:minip/providers/ModelProvider.dart';
import 'package:minip/providers/ModelRecipeProvider.dart';

import 'Pages/Home_page.dart';
import 'Pages/MianPage.dart';
import 'Pages/Welcome.dart';
import 'Pages/recipes_page.dart';
import 'Pages/SignIN_page.dart';
import 'Pages/SignOut_page.dart';
import 'package:provider/provider.dart';
import 'package:minip/Pages/User.dart';
import 'package:minip/Pages/MyhomePageWelcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  TabController _controller;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelProvider()),
        ChangeNotifierProvider(create: (_) => ModelRecipeProvider()),
        ChangeNotifierProvider(create: (_) => FoodAdditivePeovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyhomePageWelcome(),
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.black54),
        ),
        initialRoute: "./onbording",
        routes: {
          "./onbording": (context) => onbording(),
          "./MainPage": (context) => MainPage(),
          "./Home_page": (context) => Home_page(),
          "./MyHomeWelcomePage": (context) => MyhomePageWelcome(),
          './welcome': (context) => const Welcome(),
          './User': (context) => User(),
        },
      ),
    );
  }
}
