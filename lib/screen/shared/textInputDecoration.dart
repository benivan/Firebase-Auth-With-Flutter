import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
  // ####### Take A LOOK ######
  contentPadding: const EdgeInsets.only(
      left: 14.0, bottom: 8.0, top: 8.0),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(25.7),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
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
  // icon: Icon(
  //   Icons.person,
  //   color: Colors.grey,
  // ),
  // hintText: 'Enter Your Email',
  hintStyle: TextStyle(color: Colors.grey),
  // labelText: 'Email',
  labelStyle: TextStyle(
    color: Colors.black,
    fontSize: 15.0
  ),
  fillColor: Colors.white,// filledColor also need property called filled to be true for use
  filled: true,
  focusColor: Colors.white,
);