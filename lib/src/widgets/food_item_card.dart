import 'package:flutter/material.dart';
import 'package:foodapp/src/pages/food_order_detail.dart';
import 'package:foodapp/src/widgets/small_button.dart';

class FoodItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final image;
  FoodItemCard(this.description, this.title, this.price, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 130.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0, offset: Offset(0, 3), color: Colors.black12),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: image != null ? NetworkImage(image) :AssetImage("assets/krahai.jpg"), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$title",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Container(
                width: 200.0,
                child: Text("$description"),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 200.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "\u{20B5} $price",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                    InkWell(
                      child: SmallButton(
                        btnText: "Buy",
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                FoodOrderdeatil()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
