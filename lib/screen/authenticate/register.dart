import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/shared/loading.dart';
import 'package:flutter_firebase/screen/shared/textInputDecorationForEmail.dart';
import 'package:flutter_firebase/screen/shared/textInputDecorationForPassword.dart';
import 'package:flutter_firebase/service/authservice.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

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

    //Return Loading Screen While Fetching data
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
              children: [
                Flexible(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 50.0,
                      ),

                      //TextFormField For Email
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

                      //TextFormField FOr Password
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


                      SizedBox(
                        height: 12.0,
                      ),

                      Center(
                        child: Text(
                          error,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.red,
                          ),

                        ),
                      )
                    ],
                  ),
                ),

                // SignUp Button
                RaisedButton(
                  shape: StadiumBorder(),
                  color: Colors.blue,
                  splashColor: Colors.blueGrey,
                  elevation: 2,

                  child:Text('SIGN UP') ,

                  onPressed: () async {
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
                    }},
                ),


                SignInButton(Buttons.GoogleDark,
                  text: 'SingUp With Google.',
                  elevation: 2,
                  onPressed: ()async {
                    setState(() {
                      loading = true;
                    });
                    dynamic dynamicUser = await _auth
                        .signUpWithGoogle();
                    if(dynamicUser == null){
                      setState(() {
                        loading =false;
                        error = 'Wrong Google Account';
                      });
                    }
                  },)
              ],
            ),
          )),
    );
  }
}
