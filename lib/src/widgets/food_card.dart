import 'package:flutter/material.dart';

class Foodcard extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final int numberOfItems;
  Foodcard({this.categoryName, this.imagePath, this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Image(
                image: NetworkImage("tastecarefyp-7a9cd.appspot.com"),
                height: 65.0,
                width: 65.0,
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    categoryName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Text(
                    "$numberOfItems Kinds",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
