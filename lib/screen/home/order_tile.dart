import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/order.dart';

class OrderTile extends StatelessWidget {
  final Order order; // we are passing the argument from the OrderList

  OrderTile(    // Constructor
      {
      this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading:CircleAvatar(radius: 25.0,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Icon(Icons.free_breakfast_outlined,
              size: 25.0,
              color: Colors.black54,),
            ),
            backgroundColor: Colors.brown[order.strength],
          ),

          trailing: Column(children: <Widget>[
            Padding(padding:EdgeInsets.fromLTRB(0, 5.0, 10.0, 5.0),
            child: Icon(Icons.smoking_rooms_rounded,
            color: Colors.black,),),
            Text(order.cigaretteBrand,
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.red[700],
              letterSpacing: 0.3,
              fontWeight: FontWeight.bold
            ),),
          ],),

          title: Text(order.name),
          subtitle:Column(children: <Widget>[
            Text(order.brewName),
            SizedBox(height: 5.0,),
            Text('Takes ${order.sugar} Sugar')
          ],),

        ),
      ),
    );
  }
}