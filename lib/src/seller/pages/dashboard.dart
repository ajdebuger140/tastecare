import 'package:flutter/material.dart';

import 'package:foodapp/src/seller/pages/add_food_item.dart';
import 'package:foodapp/src/seller/pages/my_order.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          " Seller Dashboard",
        ),
      ),
      body: Material(
        color: Colors.white,
        child: ListView(children: [
          Card(
            elevation: 6.0,
            child: ListTile(
              leading: Icon(Icons.notification_important),
              title: Text("My Order"),
              subtitle: Text("new upcoming orders"),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => MyOrder()));
              },
            ),
          ),
          Card(
            elevation: 6.0,
            child: ListTile(
                leading: Icon(Icons.add),
                title: Text("Add Food"),
                subtitle: Text(
                    " If you want add new food item to sell tap on the add icon"),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => AddFoodItem()));
                }),
          ),
        ]),
      ),
    );
  }
}
