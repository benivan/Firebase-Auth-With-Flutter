import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/model/order.dart';
import 'package:flutter_firebase/model/user.dart';
import 'file:///C:/Users/itsme/AndroidStudioProjects/flutter_firebase/lib/service/database.dart';

class AutService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a User Object Based On firebase User

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Stream<FirebaseUser> get user{
  //   return _auth.onAuthStateChanged;
  //}

  // Auth Change User Stream
  Stream<User> get user {
    // user is instant of Stream
    // Create Stream for sending auth that user is Sign In or Out.
    // We Can Also write as Above but we are mapping Firebase user To User Class
    return _auth.onAuthStateChanged
    // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map((_userFromFirebaseUser)); // Same As Above.
  }

  // Sign In Anonymously
  Future signInAnonymously() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign In With Email And Password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print('error from SinInWithEmailAndPassword');
      print(e);
      return null;
    }
  }

  // Register With Email And Password
  Future registerWithEmailAndPassword(String email, String password) async {
      try {
        AuthResult result = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        FirebaseUser user = result.user;
        // Create a new document for the user with the uid
        await DatabaseService(uid: user.uid).updateUserDetail(
            'brewName', '0', 'new user', 100, 'Brand', '0');
        return _userFromFirebaseUser(user);
      } catch (e) {
        print(e.toString());
        return null;
      }

    // return await _auth.createUserWithEmailAndPassword(email: email, password: password)
    //     .then((value) {
    //   FirebaseUser user = value.user;
    //   return _userFromFirebaseUser(user);
    // }).catchError((onError) => onError);
  }


  // Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
