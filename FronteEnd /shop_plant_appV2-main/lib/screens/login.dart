import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class longin extends StatefulWidget {
  final VoidCallback registerPage;
  const longin({Key? key, required this.registerPage}) : super(key: key);

  @override
  State<longin> createState() => _longinState();
}

class _longinState extends State<longin> {
  final keys = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  Future SignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text.trim(), password: _pass.text.trim());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Form(
        key: keys,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Welcome Text
            const Text('Welcome to Plant Shop App',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),

            //TextField
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)),
                child: TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Email',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please fill  email Id';
                    } else if (value.contains('@') != true) {
                      return ' please fill proper email Id with @';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            //textField for pass
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                padding: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)),
                child: TextFormField(
                  controller: _pass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your password',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please type password';
                    } else if (value.isNotEmpty && value.length <= 6) {
                      return 'please type password with more than 6 characters';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),

            //Sign in btn
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              margin: const EdgeInsets.fromLTRB(10, 20, 15, 10),
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                onPressed: () {
                  if (keys.currentState!.validate()) {
                    SignIn();
                  }
                },
                child: const Center(
                    child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.black),
                )),
              ),
            ),
            //register
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member ?',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  GestureDetector(
                      onTap: widget.registerPage,
                      child: const Text('Regitser Now',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                          ))),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
