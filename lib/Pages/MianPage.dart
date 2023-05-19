import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minip/Pages/FoodAdditive_Page.dart';
import 'package:minip/Pages/Home_page.dart';
import 'package:minip/Pages/recipes_page.dart';

import 'CommunityBlockChain.dart';
import 'User.dart';

class MainPage extends StatefulWidget {

  const MainPage(
      {Key key,})
      : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  bool _loading = false;
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    _controller = TabController(length: 4, vsync: this);
    _controller.addListener(() {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "AllergyCom",
          style: GoogleFonts.acme(
              textStyle: TextStyle(
            fontSize: 25.0,
            color: Colors.black54,
            fontFamily: 'Pacifico',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.3,
          )),
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          indicatorColor: Colors.deepPurple,
          controller: _controller,
          tabs: [
            Tab(

              child: Text(
                "Scan",
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Tab(
              child: Text(
                "Tips",
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Tab(
              child: Text(
                "Recipes",
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Tab(
              child: Text(
                "Additives",
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: [
        User(),
        Home_page(loading: _loading),
        recipes_page(loading: _loading),
        FoodAdditive_Page()
      ]),
    );
  }
}
