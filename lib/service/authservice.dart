import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/model/user.dart';


class AutService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a User Object Based On firebase User

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null? User(uid: user.uid): null;
  }

  // Auth Change User Stream

  // Stream<FirebaseUser> get user{
  //   return _auth.onAuthStateChanged;
  // }
  Stream<User> get user{// user is instant of Stream                                  // Create Stream for sending auth that user is Sign In or Out.
    return _auth.onAuthStateChanged                                               // We Can Also write as Above but we are mapping Firebase user To User Class
        // .map((FirebaseUser user) => _userFromFirebaseUser(user));
           .map((_userFromFirebaseUser)); // Same As Above.

  }

  // Sign In Anonymously
  Future signInAnonymously() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }

  }

// Sign Out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}