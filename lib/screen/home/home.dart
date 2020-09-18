import 'package:flutter/material.dart';
import 'package:flutter_firebase/service/authservice.dart';

class Home extends StatelessWidget {
  final AutService _auth = AutService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0.0,
        title: Text('Home'),
        // used to add Widget In AppBar
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.person_add_disabled,
                color: Colors.red,
              ),
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Center(
          child: Container(
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: null,
                    icon: Icon(
                      Icons.person,
                      color: Colors.amber,
                      size: 50.0,
                    ),
                    label: Text(''))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
