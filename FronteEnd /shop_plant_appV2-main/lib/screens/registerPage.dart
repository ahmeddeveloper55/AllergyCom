import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class registerPage extends StatefulWidget {
  final VoidCallback showLogin;

  const registerPage({super.key, required this.showLogin});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final keys = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();

  TextEditingController _pass = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    _name.dispose();
    _pass.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Future SignUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(), password: _pass.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
            const Text('Fill Your Details',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)),
                child: TextFormField(
                  controller: _name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please fill your Full Name';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter Your name',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            //TextField
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 8),
              child: Container(
                padding: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please fill  email Id';
                    } else if (!value.contains('@')) {
                      return ' please fill proper email Id with @';
                    } else {
                      return null;
                    }
                  },
                  controller: _email,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
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
                    SignUp();
                  }
                },
                child: const Center(
                    child: Text(
                  'Sign Up',
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
                    'I am a member ?',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  GestureDetector(
                      onTap: widget.showLogin,
                      child: const Text('login Now',
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
