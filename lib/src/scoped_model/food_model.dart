import 'dart:convert';
import 'package:foodapp/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];
  bool _isloading = false;
  bool get isloading {
    return _isloading;
  }

  List<Food> get foods {
    return List.from(_foods);
  }

  Future<bool> addFood(Food food) async {
    // _foods.add(food); //this one now uncommented
    _isloading = true;
    notifyListeners();
    try {
      final Map<String, dynamic> foodData = {
        "title": food.name,
        "description": food.description,
        "price": food.price,
        "category": food.price,
        "discount": food.discount,
      };
      final http.Response response = await http.post(
          "https://tastecarefyp-7a9cd.firebaseio.com/foods.json",
          body: json.encode(foodData));
      final Map<String, dynamic> responseData = json.decode(response.body);
      //print(responseData["name"]);
      // ignore: unused_local_variable
      Food foodWithID = Food(
        id: responseData["name"],
        name: food.name,
        description: food.description,
        discount: food.discount,
        category: food.category,
        price: food.price,
      );
      _foods.add(foodWithID);

      _isloading = false;
      notifyListeners();
      fetchFoods(); //ye function
      return Future.value(true);
    } catch (e) {
      _isloading = false;
      notifyListeners();
      return Future.value(false);
      // print("Connection error:$e");
    }
  }

  Future<bool> fetchFoods() async {
    _isloading = true;
    notifyListeners();
    try {
      final http.Response response =
          await http.get("https://tastecarefyp-7a9cd.firebaseio.com/.json");

      //print("Fetching data:${response.body}");
      final Map<String, dynamic> fetchedData = json.decode(response.body);
      print(fetchedData);
      final List<Food> foodItems = [];
      fetchedData.forEach((String id, dynamic foodData) {
        Food foodItem = Food(
          id: id,
          name: foodData["title"],
          description: foodData["description"],
          category: foodData["category"],
          price: foodData["price"],
          discount: foodData["discount"],
        );
        foodItems.add(foodItem);
      });
      _foods = foodItems;
      _isloading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      _isloading = false;
      notifyListeners();
      return Future.value(false);
    }
  }
}
