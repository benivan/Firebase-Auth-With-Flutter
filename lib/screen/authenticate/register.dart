import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/shared/loading.dart';
import 'package:flutter_firebase/screen/shared/textInputDecorationForEmail.dart';
import 'package:flutter_firebase/screen/shared/textInputDecorationForPassword.dart';
import 'package:flutter_firebase/service/authservice.dart';

class Register extends StatefulWidget {
  final Function toggleSignIn;

  Register({this.toggleSignIn});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AutService _auth = AutService();
  final _formkey = GlobalKey<FormState>();

  // Text Field State
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0.0,
        title: Text(
          'REGISTER',
          style: TextStyle(letterSpacing: 1.0),
        ),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget
                    .toggleSignIn(); // we cant use this.toggleSignIn tis refers State object and toggleSignIn is Widget object
              },
              icon: Icon(
                Icons.person,
                color: Colors.lightBlue,
              ),
              label: Text(
                'LogIn',
                style: TextStyle(color: Colors.lightBlue, letterSpacing: 1.0),
              ))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  decoration: textInputDecorationForEmail,
                  // Input Text Color
                  style: TextStyle(color: Colors.white),

                  validator: (value) {
                    if (value.isEmpty) {
                      // ignore: missing_return
                      return 'Enter Your Email';
                    }
                    return null;
                  },
                  //This Function gives us the current value what user is typed.(deleting updating While typing )
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  decoration: textInputDecorationForPassword,
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value.length < 6) {
                      return 'password must be at least 6 characters long';
                    }
                    return null;
                  },
                  // ObscureText hide the inputs as ******* Like password
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),

                //******SIGNIN BUTTON******
                Container(
                    height: 40.0,
                    width: 100.0,
                    child: GestureDetector(
                      onTap: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic dynamicUser = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (dynamicUser == null) {
                            setState(() {
                              loading = false;
                              error = 'Please provide a valid email.' ;
                            });
                          }
                        }
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blueAccent,
                        color: Colors.lightBlue,
                        elevation: 2.0,
                        child: Center(
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  error,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
