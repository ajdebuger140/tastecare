import 'package:flutter/material.dart';
import 'package:foodapp/src/pages/sigin_page.dart';
import 'package:foodapp/src/seller/pages/seller_signin.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({Key key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                color: Colors.pink,
                child: Text('As a Seller'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SellerSignIn()));
                }),
            FlatButton(
              color: Colors.pink,
              child: Text('AS A Buyer'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SignInPage()));
              },
            ),
          ]),
    );
  }
}
