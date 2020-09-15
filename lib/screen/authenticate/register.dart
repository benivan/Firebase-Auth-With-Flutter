import 'package:flutter/material.dart';
import 'package:flutter_firebase/service/authservice.dart';

class Register extends StatefulWidget {

  final Function toggleSignIn;
  Register({this.toggleSignIn});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AutService _auth = AutService();
  final _formkey = GlobalKey<FormState>();

  // Text Field State
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0.0,
        title: Text(
          'REGISTER',
          style: TextStyle(letterSpacing: 1.0),
        ),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
                widget.toggleSignIn();  // we cant use this.toggleSignIn tis refers State object and toggleSignIn is Widget object
              },
              icon: Icon(
                Icons.person,
                color: Colors.lightBlue,
              ),
              label: Text(
                'LogIn',
                style: TextStyle(color: Colors.lightBlue, letterSpacing: 1.0),
              ))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Form(
            key:_formkey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    // ####### Take A LOOK ######
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    icon: Icon(
                      Icons.person,
                      color: Colors.orangeAccent[100],
                    ),
                    hintText: 'Enter Your Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.grey[200],
                    ),
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                  ),
                  // Input Text Color
                  style: TextStyle(color: Colors.white),

                  validator: (value) {
                    if (value.isEmpty) {
                      // ignore: missing_return
                      return 'Enter Your Email';
                    }
                    return null;
                  },
                  //This Function gives us the current value what user is typed.(deleting updating While typing )
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
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
                      focusColor: Colors.grey),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value.length <6) {
                      return 'password must be at least 6 characters long';
                    }
                    return null;
                  },
                  // ObscureText hide the inputs as ******* Like password
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(
                  height: 50.0,
                ),

                //******SIGNIN BUTTON******
                Container(
                    height: 40.0,
                    width: 100.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.blueAccent,
                      color: Colors.lightBlue,
                      elevation: 2.0,
                      child: GestureDetector(
                        onTap: () async {
                          if(_formkey.currentState.validate()){
                            dynamic dynamicUser = await _auth.registerWithEmailAndPassword(email, password);
                            if(dynamicUser == null){
                              setState(() {
                                error = 'Not A valid User';
                              });
                            }
                          }
                        },
                        child: Center(
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          )),
    );
    ;
  }
}
