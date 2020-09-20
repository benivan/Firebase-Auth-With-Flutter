import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/model/order.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //Collection Reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brew');

  Future updateUserDetail(String brewName, String sugar, String name,
      int strength, String cigaretteBrand, String cigaretteQuantity) async {
    return await brewCollection.document(uid).setData({
      'brewName': brewName,
      'sugar': sugar,
      'name': name,
      'strength': strength,
      'cigaretteBrand': cigaretteBrand,
      'cigaretteQuantity': cigaretteQuantity
    });
  }
  // Create a Order Object Based on QuerySnapshot

  List<Order> _orderListFromSanpshot(QuerySnapshot snapshot){
    return snapshot.documents.map((e) => Order(
        name: e.data['name'] ?? '',
        brewName: e.data['brewName'] ??'',
        strength: e.data['strength'] ?? 0,
        cigaretteBrand: e.data['cigaretteBrand'] ?? '',
        sugar: e.data['sugar'] ?? '0',
        cigaretteQuantity: e.data['cigaretteQuantity'] ?? ''
    )).toList();
  }
  
  Stream<List<Order>> get order{
    return brewCollection.snapshots()
    // .map((QuerySnapshot snapshot) => _orderListFromSanpshot(snapshot));  "OR"
    .map(_orderListFromSanpshot);
  }
}
