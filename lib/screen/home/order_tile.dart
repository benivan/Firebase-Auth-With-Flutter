import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/order.dart';
import 'package:flutter_firebase/model/user.dart';
import 'package:flutter_firebase/service/database.dart';
import 'package:provider/provider.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  final bool isOwner;

  // we are passing the argument from the OrderList

  OrderTile(
      // Constructor
      {this.order,
      this.isOwner = false});


  @override
  Widget build(BuildContext context) {

        return Card(
          elevation: 5.0,

          color: isOwner ? Colors.grey[600] :Colors.blueGrey,
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
                  child: CircleAvatar(
                    radius: 25,
                    child: Padding(
                      padding: const EdgeInsets.only(top:40 ,left: 2),
                      child: Text('Buds:${order.cigaretteQuantity}',
                        style: TextStyle(fontSize:11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3,
                          color: Colors.black
                        ),
                      ),
                    ),

                    backgroundColor: isOwner ? Colors.grey[600]:Colors.blueGrey,
                    backgroundImage: AssetImage('assets/cigarette_box.png'),
                  ),

                ),

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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(order.brewName,
                      style: TextStyle(color: Colors.white54),),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text('Sugars: ${order.sugar}',
                      style: TextStyle(color: Colors.grey[400]),),



                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    order.cigaretteBrand,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 0.3
                    ),),
                )
                ],
              ),
            ),
          ),
        );

  }
}
