import 'package:flutter/material.dart';
import 'package:flutter_firebase/service/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  final AutService _auth = AutService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
        title: Text('Home'),
        // used to add Widget In AppBar
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person_add_disabled),
              label: Text('Logout'))
        ],
      ),
    );
  }
}
