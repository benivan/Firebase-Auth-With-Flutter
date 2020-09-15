import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/user.dart';
import 'package:flutter_firebase/screen/authenticate/authenticate.dart';
import 'package:flutter_firebase/screen/home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context); // here we accessing user data from provider stream (what we done in Main.dart) , its knows what kind of data need based of that access the Stream
     if(user == null){
       return Authenticate();
    }else{
       return Home();
     }
  }
}
