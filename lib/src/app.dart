import 'package:flutter/material.dart';
import 'package:foodapp/src/pages/favorite_page.dart';
//import 'package:foodapp/src/scoped_model/food_model.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/screens/Splash_screen.dart';
import 'package:foodapp/src/seller/pages/add_food_item.dart';

import 'package:scoped_model/scoped_model.dart';

class App extends StatelessWidget {
  final MainModel mainModel = MainModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "food ordering  app",
        theme: ThemeData(primaryColor: Colors.pink),

        //  home: //MainScreen(model: mainModel),
        home: FavoritePage(),
        //   home: AddFoodItem(),
      ),
    );
  }
}
