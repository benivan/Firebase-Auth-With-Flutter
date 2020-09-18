import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/authenticate/register.dart';
import 'package:flutter_firebase/screen/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool setSignIn = true;

  void toggleSignIn() {
    setState(() {
      setSignIn = !setSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (setSignIn) {
      return SignIn(toggleSignIn: toggleSignIn);
    } else {
      return Register(toggleSignIn: toggleSignIn);
    }
  }
}
