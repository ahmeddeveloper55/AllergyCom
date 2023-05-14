import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/PostBus.dart';
import '../providers/FoodAdditiveProvider.dart';
class FoodAdditive_Page extends StatefulWidget {
  const FoodAdditive_Page({Key key}) : super(key: key);

  @override
  _FoodAdditive_PageState createState() => _FoodAdditive_PageState();
}

class _FoodAdditive_PageState extends State<FoodAdditive_Page> {
  static List<PostBus> _userDetails = [];
  static List<PostBus> _searchresult = [];

  TextEditingController controller = new TextEditingController();



  @override
  void initState() {
    super.initState();
    final providermodel = Provider.of<FoodAdditivePeovider>(context,listen: false);
    providermodel.getALLAdditive(_userDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(4.0,15,4.0,0),
                child: Container(
                  child: new Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child:  ListTile(
                        title: TextField(
                          controller: controller,
                          decoration: InputDecoration(

                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            filled: false,
                            hintText: 'search',
                          ),
                          onChanged: onChangedtext,
                        ),
                        trailing: new IconButton(
                          icon: new Icon(Icons.cancel),
                          onPressed: () {
                            controller.clear();
                            onChangedtext('');
                          },
                        ),
                      ),

                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              new Expanded(
                child: _searchresult.length != 0 || controller.text.isNotEmpty
                    ? new ListView.builder(
                    itemCount: _searchresult.length,
                    itemBuilder: (context, i) {
                      return Card(
                        margin: EdgeInsets.all(12.0),
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ListTile(
                            title: Text(_searchresult[i].description != null
                                ? _searchresult[i].description
                                : 'ff'),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3.0, vertical: 4),
                              child: Text(_searchresult[i].category),
                            ),
                            leading: Text(_searchresult[i].number),
                            trailing: Text(_searchresult[i].status),
                            dense: true,
                          ),
                        ),
                      );
                    })
                    : ListView.builder(
                    itemCount: _userDetails.length,
                    itemBuilder: (context, i) {
                      return Card(
                        margin: EdgeInsets.all(12.0),
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ListTile(
                            title: Text(_userDetails[i].description.toString()),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal:4.0 ),
                              child: Text(_userDetails[i].category.toString()),
                            ),

                            leading: Text(_userDetails[i].number),
                            trailing: Text(_userDetails[i].status),
                            dense: true,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onChangedtext(String s) async {
    _searchresult.clear();
    if (s.isEmpty) {
      setState(() {});
      return;
    }
    _userDetails.forEach((user) {
      if (user.description.contains(s)||user.number.contains(s)||user.status.contains(s)) {
        _searchresult.add(user);
      }
    });
    setState(() {});
  }
}
