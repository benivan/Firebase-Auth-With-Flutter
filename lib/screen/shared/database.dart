import 'package:cloud_firestore/cloud_firestore.dart';
 class DatabaseService{
   //Collection Reference
   final CollectionReference brewCollection = Firestore.instance.collection('brew');

   final String uid;
   DatabaseService({this.uid});

   Future updateUserDetail(String brewName,String sugar, String name, int strength,String cigaretteBrand, String cigaretteQuantity) async{
     return await brewCollection.document(uid).setData({
       'brewName':brewName,
       'sugar':sugar,
       'name':name,
       'strength':strength,
       'cigaretteBrand':cigaretteBrand,
       'cigaretteQuantity':cigaretteQuantity
     });
   }
 }