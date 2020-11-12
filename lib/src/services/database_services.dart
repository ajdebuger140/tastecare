import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodapp/src/models/food_model.dart';

class DatabaseService{
  final _dbServices = FirebaseFirestore.instance;


  static final DatabaseService _singleton =
  DatabaseService._internal();

  factory DatabaseService() {
    return _singleton;
  }

  DatabaseService._internal();

  ///
  /// Get all Food
  ///
  Future<List<Food>> fetchFood() async{
    List<Food> allFoods = [];
    try{
      QuerySnapshot snapshot = await _dbServices.collection("foods").get();
      if(snapshot.docs.length < 1){
        print("There is no Food in food collection");
      }
      for(int i = 0; i < snapshot.docs.length; i++){
        allFoods.add(new Food.fromJson(snapshot.docs[i].data(), snapshot.docs[i].id));
      }

    }catch(e){
      print("@fetchFoods has exception :" +e);
    }
    return allFoods;
  }

  ///
  /// Add Food to collection
  ///
  addFoods(Food food) async{
    try{
      await _dbServices.collection("foods").add(food.toJson());
    }catch(e){
      print("@addFoods has exception :" +e);
    }
  }

}