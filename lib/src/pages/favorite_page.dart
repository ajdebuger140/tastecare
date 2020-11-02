import 'package:flutter/material.dart';
import 'package:foodapp/src/models/food_model.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/food_item_card.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoritePage extends StatefulWidget {
  final MainModel model;
  FavoritePage({this.model});
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    //  widget.model.fetchFoods(); // ye walla
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          model.fetchFoods(); //this will fetch and notifylistener()
          List<Food> foods = model.foods;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: foods.map((Food food) {
              return FoodItemCard(
                food.name,
                food.description,
                food.price.toString(),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
