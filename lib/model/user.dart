class User {
  final String uid;

  //Constructor
  User({this.uid});


}


class UserData {
  final String uid;
  final String name;
  final String brewName;
  final String sugar;
  // ignore: non_constant_identifier_names
  final int strength;
  final String cigaretteQuantity;
  final String cigaretteBrand;


  UserData({
    // ignore: non_constant_identifier_names
    this.uid, this.sugar, this.cigaretteBrand, this.name, this.brewName, this.cigaretteQuantity, this.strength,
  });

}