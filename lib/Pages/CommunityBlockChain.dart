import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

import '../ServiceBlockChain/eth_utils.dart';
import '../constant/Constant.dart';

class CommunityBlockChain extends StatefulWidget {
  const CommunityBlockChain({Key key}) : super(key: key);

  @override
  State<CommunityBlockChain> createState() => _CommunityBlockChainState();
}

class _CommunityBlockChainState extends State<CommunityBlockChain> {
  final title_Controller = TextEditingController();
  final desc_Controller = TextEditingController();
  Client httpClient;
  bool _isLoading = false;
  Web3Client ethClient;
  var votes = List<int>.filled(100, 0);
  List<dynamic> _myData = [];
  double _value = 0.0;
  Future<void> _showCreateContentDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController titleController = TextEditingController();
        TextEditingController descController = TextEditingController();

        return AlertDialog(
          title: Text('Create New Content'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(
                  hintText: 'Description',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String title = titleController.text;
                String description = descController.text;
                setState(() {
                  _isLoading = true; // Set loading state to true
                });
                addPost(title, description, ethClient);

                setState(() {
                  _isLoading = false; // Set loading state to true
                });
                setState(() {});
                Navigator.pop(context);
              },
              child: Text('Submit'),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(infura_url, httpClient);
    super.initState();
    String username = "ahmed22";
    String password = "test";
    getBalance(ethClient).then((data) => {
      print("neeee $data"),
      setState(() {
        _myData = data;
      }),
      print("neeeed $_myData"),
    });
    // registerUser(username, password, ethClient)
    //     .then((data) => {
    //           print("Registration successful: $data"),
    //           // Do something with the returned data if necessary
    //         })
    //     .catchError((error) => {
    //           print("Registration failed: $error"),
    //           // Handle the error if necessary
    //         });
    print("size : ${_myData.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
        child: Center(
          child: Container(
            child: ListView.builder(
                itemCount: _myData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 5, 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Center(
                            child: Container(
                              // color: Colors.green,
                              width: double.infinity,
                              height: 150,
                              child: Row(
                                children: [
                                  Card(
                                    elevation: 0,
                                    color:
                                    Colors.white10.withOpacity(0.4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(30),
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () async {

                                                await voteContent(index,
                                                    true, ethClient).then((value){
                                                      Fluttertoast.showToast(
                                                    msg: 'Your Upvote will 15 sec to appear',
                                                          backgroundColor:Colors.deepPurple,
                                                        gravity: ToastGravity.CENTER,
                                                        textColor: Colors.white,
                                                        toastLength: Toast.LENGTH_LONG,


                                                      );

                                                    });
                                              },
                                              icon: Icon(
                                                  Icons.arrow_upward),
                                            ),
                                            Text("${_myData[index][3]}"),
                                            IconButton(
                                              onPressed: () async {

                                                await downvoteContent(index,
                                                    false, ethClient).then((value)  {
                                                      Fluttertoast.showToast(
                                                    msg: 'Your downVote will 15 sec to appear',
                                                        backgroundColor:Colors.deepPurple,
                                                        gravity: ToastGravity.CENTER,
                                                        textColor: Colors.white,
                                                        toastLength: Toast.LENGTH_LONG,


                                                      );

                                                    }

                                                );
                                              },
                                              icon: Icon(
                                                  Icons.arrow_downward),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: Container(
                                                padding:
                                                EdgeInsets.fromLTRB(
                                                    10, 5, 0, 0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Tile : ",
                                                      textAlign:
                                                      TextAlign.start,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w300,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(

                                                        child: Text(
                                                          "${_myData[index][1]}",
                                                          textAlign:
                                                          TextAlign.start,
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 0.8, // Thickness
                                              color: Colors.grey,
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                EdgeInsets.fromLTRB(
                                                    10, 11, 0, 5),
                                                child: Text(
                                                  "${_myData[index][2]}",
                                                  textAlign:
                                                  TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () => _showCreateContentDialog(),
        tooltip: 'Create Content',
        child: Icon(Icons.add),
      ),
    );
  }
}