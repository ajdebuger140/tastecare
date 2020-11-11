import 'dart:convert';
import 'dart:io';
import 'package:foodapp/src/models/food_model.dart';
import 'package:foodapp/src/services/database_services.dart';
import 'package:foodapp/src/services/database_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  final _dbService = DatabaseService();
  final _dbStorage = DatabaseStorageServices();
  //String foodImage;
  File image;
  Food food = new Food();




  List<Food> _foods = [];
  bool _isloading = false;
  bool get isloading {
    return _isloading;
  }

  List<Food> get foods {
    return List.from(_foods);
  }

  Future<bool> addFood(Food food) async {
    _foods.add(food); //this one now uncommented //isko comment kro
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

      Food foodWithID = Food(
        id: responseData["name"],
        name: food.name,
        description: food.description,
        category: food.category,
        discount: food.discount,
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
        Food food = Food(
          id: foodData["id"],
          name: foodData["title"],
          description: foodData["description"],
          category: foodData["category"],
          price: double.parse(foodData["price"]),
          discount: double.parse(foodData["discount"]),
        );
        foodItems.add(food);
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


  /// get All Foods
  fetchAllFoods() async{
    _foods = await _dbService.fetchFood();
    _isloading = false;
    notifyListeners();
  }

  /// get Image From Gallery
  Future<bool> getImageFromGallery() async {
    final pickedImage =
    await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  /// Add food to database
  addFoods() async{
    try{
      final foodImage = await _dbStorage.uploadImage(image);
      print("@img url" + foodImage);
      food.imagePath = foodImage ?? "";
      await _dbService.addFoods(food);
      _isloading = false;
      notifyListeners();
    }catch(e){
      print("@addFood Model has exception " +e);
    }

  }





}
