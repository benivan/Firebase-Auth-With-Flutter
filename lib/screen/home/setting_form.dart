import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/user.dart';
import 'package:flutter_firebase/screen/shared/loading.dart';
import 'package:flutter_firebase/screen/shared/textInputDecoration.dart';
import 'package:flutter_firebase/service/database.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final List<String> cigaretteBrands = [
    'Marlboro',
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
  String _currentBrewName;
  String _currentCigaretteBrand;
  String _currentCigaretteQuantity;
  int _currentStrength;

  // @override
  // void initState() {
  //   super.initState();
  //
  //   _currentName = 'new User';
  //   _currentBrewName = 'brewName';
  //   _currentSugar = '1';
  //   _currentStrength= 100;
  //   _currentCigaretteQuantity =  '2';
  //   _currentCigaretteBrand = 'Marlboro';
  //
  // }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        // userData is Stream Name in DatabaseService class
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
                key: _formkey,
                child: Column(
                  children: [
                    Flexible(
                      child: ListView(
                        children: <Widget>[
                          Center(
                            child: Text(
                              'UPDATE YOUR ORDER. ',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),

                          SizedBox(
                            height: 15.0,
                          ),

                          //Name TextFormField
                          TextFormField(
                            initialValue: userData.name ?? _currentName,
                            decoration: textInputDecoration.copyWith(
                              // CopyWith help us to write the properties that we want in.
                              labelText: 'Name',
                              hintText: 'Enter Your Name',
                              icon: Icon(
                                Icons.person,
                                color: Colors.brown[900],
                              ),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'Please Enter a Name ' : null,
                            onChanged: (val) => setState(() => _currentName = val),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),

                          //BrewName TextFormField
                          TextFormField(
                            initialValue: userData.brewName ?? _currentBrewName,
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
                                val.isEmpty ? 'Please Enter Brew Name ' : null,
                            onChanged: (val) =>
                                setState(() => _currentBrewName = val),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),

                          // Drop Down Form Field FOr Sugar
                          DropdownButtonFormField(
                            value: userData.sugar ?? _currentSugar,
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

                          SizedBox(
                            height: 10,
                          ),

                          // Slider
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Slider(
                                value: (_currentStrength ?? userData.strength)
                                    .toDouble(),
                                activeColor: Colors
                                    .brown[_currentStrength ?? userData.strength],
                                inactiveColor: Colors.brown[200],

                                min: 100,
                                max: 900,
                                divisions: 8,
                                onChanged: (val) =>
                                    setState(() => _currentStrength = val.round())),
                          ),

                          SizedBox(
                            height: 10,
                          ),


                          // DropDown For Quantity.
                          DropdownButtonFormField<String>(
                            value:  userData.cigaretteQuantity ?? _currentCigaretteQuantity,
                            items: cigaretteQuantity
                                .map((e) =>
                                    DropdownMenuItem<String>(value: e, child: Text(e)))
                                     .toList(),

                            onChanged: (val) =>
                                setState(() => _currentCigaretteQuantity = val),
                            decoration: textInputDecoration.copyWith(
                              icon: Icon(Icons.settings)
                            ),
                          ),


                          SizedBox(
                            height: 10,
                          ),

                          //Dropdown FOr Brands
                          DropdownButtonFormField<String>(
                            value: userData.cigaretteBrand ?? _currentCigaretteBrand,
                              items:cigaretteBrands.map((e) => DropdownMenuItem(value: e,child: Text(e)))
                              .toList(),

                            onChanged: (val) =>
                                  setState(() => _currentCigaretteBrand = val),
                            decoration: textInputDecoration.copyWith(
                              icon: Icon(Icons.bug_report)
                            ),

                          ),


                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //Update Button

                    RaisedButton(child:Text('Update'),
                      shape: StadiumBorder(),
                      color: Colors.blue,
                      splashColor: Colors.blueGrey,

                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          await DatabaseService(uid: user.uid)
                              .updateUserDetail(
                              _currentBrewName ?? userData.brewName,
                              _currentSugar ?? userData.sugar,
                              _currentName ?? userData.name,
                              _currentStrength ?? userData.strength,
                              _currentCigaretteBrand ??
                                  userData.cigaretteBrand,
                              _currentCigaretteQuantity ??
                                  userData.cigaretteQuantity)
                              .then(
                                  (value) => Navigator.of(context).pop());
                        }

                      },)

                  ],
                ));
          } else {
            return Loading();
          }
        });
  }
}
