import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/shared/loading.dart';
import 'package:flutter_firebase/screen/shared/textInputDecorationForEmail.dart';
import 'package:flutter_firebase/screen/shared/textInputDecorationForPassword.dart';
import 'package:flutter_firebase/service/authservice.dart';

class SignIn extends StatefulWidget {
  final Function toggleSignIn;

  SignIn({this.toggleSignIn});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AutService _auth = AutService();
  final _formkey =
      GlobalKey<FormState>(); // Create a global key to keep state of our form

  // Text Field State
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    //Return Loading Screen While Fetching data
    return loading ? Loading():Scaffold(
      backgroundColor: Colors.grey[900],

      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0.0,
        title: Text(
          'SIGN IN',
          style: TextStyle(letterSpacing: 1.0),
        ),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget
                    .toggleSignIn(); // we cant use this.toggleSignIn tis refers State object and toggleSignIn is Widget object
              },
              icon: Icon(
                Icons.person_add,
                color: Colors.green,
              ),
              label: Text(
                'Register',
                style: TextStyle(color: Colors.green),
              ))
        ],
      ),

      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Form(
            key: _formkey,
            // This Tell State of our form globally later we can validate our form using this key
            child: Column(
              children: [
                Flexible(
                  child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 50.0,
                        ),

                        //TextFormField For Email
                        TextFormField(
                          decoration: textInputDecorationForEmail,
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

                        //TextFormField For Password
                        TextFormField(
                          decoration: textInputDecorationForPassword,

                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value.length < 6) {
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
                          height: 30.0,
                        ),



                        SizedBox(
                          height: 12.0,
                        ),

                        //Error Text
                        Center(
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                        )
                      ],
                    ),
                ),


                //Login Button
                RaisedButton(
                  shape: StadiumBorder(),
                  elevation: 2,
                  color: Colors.green,
                  splashColor: Colors.green[200],

                  child: Text('LOGIN'),

                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic dynamicUser = await _auth
                          .signInWithEmailAndPassword(email, password);
                      if (dynamicUser == null) {
                        setState(() {
                          loading =false;
                          error = 'Email or Password must be wrong.';
                        });
                      }
                    }
                  },),

              ],
            ),
          )),
    );
  }
}
