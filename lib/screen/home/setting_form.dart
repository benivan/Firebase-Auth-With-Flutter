import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/shared/textInputDecoration.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final List<String> cigaretteBrands = [
    'Marlboro ',
    'Gold Flake',
    'Classic',
    'Camel',
    'Natural American Spirit'
  ];
  final List<String> cigaretteQuantity = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  // form value

  String _currentName;
  String _currentSugar;
  String _currnetBrewName;
  String _currnetCigaretteBrand;
  String _currentCigaretteQuantity;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'UPDATE YOUR ORDER. ',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 7.0,
            ),

            TextFormField(
              decoration: textInputDecoration.copyWith(
                // Copy with help us to write the properties that we want in
                labelText: 'Name',
                hintText: 'Enter Your Name',
                icon: Icon(
                  Icons.person,
                  color: Colors.brown[900],
                ),
              ),
              validator: (val) => val.isEmpty ? 'Please Enter a Name ' : Null,
              onChanged: (val) => setState(() => _currentName = val),
            ),
            SizedBox(
              height: 7.0,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(
                // Copy with help us to write the properties that we want in
                labelText: 'Brew Name',
                hintText: 'Enter Brew Name',
                icon: Icon(
                  Icons.local_cafe_rounded,
                  color: Colors.brown,
                ),
              ),
              validator: (val) =>
                  val.isEmpty ? 'Please Enter Brew Name ' : Null,
              onChanged: (val) => setState(() => _currnetBrewName = val),
            ),

            SizedBox(
              height: 7.0,
            ),

            // Drop Down Form Field
            DropdownButtonFormField(
              items: sugars.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text('$e sugars'),
                );
              }).toList(),

              // Also Write Like This
              // .map((e) => DropdownMenuItem(value: e,child: Text('$e Sugars'))).toList(),
              onChanged: (val) => setState(() => _currentSugar = val),
              decoration: textInputDecoration.copyWith(
                  labelText: 'Sugar',
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.brown,
                  )),
            ),



            // Slider
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Slider(
                  value:(_currentStrength ?? 100).toDouble(),
                activeColor: Colors.brown[_currentStrength ?? 100],
                  inactiveColor: Colors.brown[200],
                  min: 100,
                  max: 900,
                  divisions: 8,
                  onChanged: (val) =>
                      setState(() => _currentStrength = val.round())),
            ),


            DropdownButtonFormField(
              items: cigaretteBrands.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text('$e'),
                );
              }).toList(),

              // Also Write Like This
              // .map((e) => DropdownMenuItem(value: e,child: Text('$e Sugars'))).toList(),
              onChanged: (val) => setState(() => _currnetCigaretteBrand = val),
              decoration: textInputDecoration.copyWith(
                  labelText: 'Brands',
                  icon: Icon(
                    Icons.settings,
                    color: Colors.grey[700],
                  )),
            ),
            SizedBox(
              height: 7.0,
            ),

            DropdownButtonFormField(
              items: cigaretteQuantity
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        '$e',
                        style: TextStyle(
                            fontSize: 18.0),
                      )))
                  .toList(),
              onChanged: (val) =>
                  setState(() => _currentCigaretteQuantity = val),
              decoration: textInputDecoration.copyWith(
                  labelText: 'Quantity',
                  icon: Icon(
                    Icons.settings,
                    color: Colors.grey[700],
                  )),
            ),

            SizedBox(
              height: 10.0,
            ),


            //Button
            Padding(
              padding: const EdgeInsets.only(left: 29.0),
              child: Container(
                  height: 40.0,
                  width: 90.0,
                  child: GestureDetector(
                    onTap: () async {
                      print(_currentName);
                      print(_currnetBrewName);
                      print(_currentStrength);
                      print(_currentSugar);
                      print(_currnetCigaretteBrand);
                      print(_currentCigaretteQuantity);
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.lightBlue,
                      color: Colors.blue,
                      elevation: 2.0,
                      child: Center(
                        child: Text(
                          'UPDATE',
                          // Button is Only Working on text field nol all button is clickable
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}
