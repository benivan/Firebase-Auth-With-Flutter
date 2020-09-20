import 'package:flutter/material.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {

  final _formkey = GlobalKey<FormState>();
  final List<String> sugar = ['0','1','2','3','4'];

  // form value

  String _currentName;
  String _currentSugar;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(key: _formkey,child: Column(
      children: <Widget>[

      ],
    ));
  }
}
