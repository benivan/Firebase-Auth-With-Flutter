import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

var textInputDecorationForPassword = InputDecoration(
    contentPadding: const EdgeInsets.only(
        left: 14.0, bottom: 8.0, top: 8.0),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(25.7),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(25.7),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent),
      borderRadius: BorderRadius.circular(25.7),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent),
      borderRadius: BorderRadius.circular(25.7),
    ),
    icon: Icon(
      Icons.vpn_key_sharp,
      color: Colors.orangeAccent[100],
    ),
    hintText: 'Enter Password',
    labelText: 'Password',
    hintStyle: TextStyle(color: Colors.grey),
    labelStyle: TextStyle(
      color: Colors.grey[200],
    ),
    fillColor: Colors.grey,
    focusColor: Colors.grey
);
