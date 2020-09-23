import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/order.dart';
import 'package:flutter_firebase/model/user.dart';
import 'package:provider/provider.dart';

class OrderTile extends StatelessWidget {
  final Order order; // we are passing the argument from the OrderList

  OrderTile(
      // Constructor
      {this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.blueGrey,
      shape: StadiumBorder(),
      // RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(35)),
      //     side: BorderSide(width: 5, color: Colors.grey[100]))

      margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0,0 ),
      child: ListTile(
        isThreeLine: true,
        leading: CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage('assets/coffee_icon.png'),

          backgroundColor: Colors.brown[order.strength],
        ),
        trailing: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.smoking_rooms_rounded,
                color: Colors.red[900],
              ),
            ),
            Text(
              order.cigaretteBrand,
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                  letterSpacing: 0.1,
              ),
            ),
            Text('Buds ${order.cigaretteQuantity}',
            style: TextStyle(fontSize: 10),
            )
          ],
        ),
        
        
        title: Padding( padding: EdgeInsets.only(left: 10),
            child: Text(
          order.name,
          style: TextStyle(fontSize: 18, color: Colors.black,
          fontWeight: FontWeight.bold),
        )),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5,left: 0),
          child: Column(
            children: <Widget>[
              Text(order.brewName,
              style: TextStyle(color: Colors.white54),),
              SizedBox(
                height: 3.0,
              ),
              Text('Sugars ${order.sugar}',
              style: TextStyle(color: Colors.grey[400]),)
            ],
          ),
        ),
      ),
    );
  }
}
