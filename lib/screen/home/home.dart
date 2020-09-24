import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/order.dart';
import 'package:flutter_firebase/screen/home/order_list.dart';
import 'package:flutter_firebase/screen/home/setting_form.dart';
import 'package:flutter_firebase/service/authservice.dart';
import 'package:flutter_firebase/service/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AutService _auth = AutService();

  @override
  Widget build(BuildContext context) {

    void _showsSettingPanel(){
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
          child: SettingForm(),
        );
      });
    }
    // ignore: missing_required_param
    return StreamProvider<List<Order>>.value(
      // here we specifies that we want to use Stream from database class and stream name brew
      value: DatabaseService().order,
      child: Scaffold(
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
                  Icons.person,
                  color: Colors.red,
                ),
                label: Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                )),


            FlatButton.icon(
                onPressed: () => _showsSettingPanel(),
                icon: Icon(Icons.settings,
                color: Colors.grey,),
                label: Text('Setting',
                style: TextStyle(
                  color: Colors.grey
                ),))


          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: OrderList(),
        ),
      ),
    );
  }
}
