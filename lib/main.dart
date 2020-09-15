import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/user.dart';
import 'package:flutter_firebase/screen/wrapper.dart';
import 'package:flutter_firebase/service/authservice.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {                                              // Here Stream Listening for User Is Sign In or Out If Signed In then Get User value and else get null
    return StreamProvider<User>.value(                                              // value methos what stream and what data we are actually accept get back
      value: AutService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       home: Wrapper(),
                                                                  //When Change Occur we  can listen inside the  wrapper
      ),
    );
  }
}

