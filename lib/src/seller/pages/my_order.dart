import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  MyOrder({Key key}) : super(key: key);

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("My Order"),
      
      ),
      body: Container(
        child: Center(
          child: Text(""),
        ),
      ),
    );
  }
}
