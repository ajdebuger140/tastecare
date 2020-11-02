import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/src/models/food_model.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/button.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  AddFoodItem({Key key}) : super(key: key);

  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  String title;
  String category;
  String description;
  String price;
  String discount;
  GlobalKey<FormState> _foodItemFormKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldStateKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 16.0),
          // width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          child: Form(
            key: _foodItemFormKey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      // color: Colors.orange,
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage("assets/noimage.png"),
                      )),
                ),
                _buildTextFormField("Food Title"),
                _buildTextFormField("Category"),
                _buildTextFormField("Description", maxLine: 3),
                _buildTextFormField("Price"),
                _buildTextFormField("Discount"),
                SizedBox(
                  height: 30.0,
                ),
                ScopedModelDescendant(
                    builder: (BuildContext, Widget child, MainModel model) {
                  return GestureDetector(
                    onTap: () {
                      OnSubmit(model.addFood);
                      if (model.isloading) {
                        showLoadingIndicator();
                      }
                    },
                    child: Button(
                      btnText: "Add Food Item",
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void OnSubmit(Function addFood) async {
    if (_foodItemFormKey.currentState.validate()) {
      _foodItemFormKey.currentState.save();
      final Food food = Food(
        name: title,
        category: category,
        description: description,
      );
      bool value = await addFood(food);
      if (value) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text("Food Item is sucessfully added."),
        );
        _scaffoldStateKey.currentState.showSnackBar(snackBar);
      } else if (!value) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text("Faild to add Food item."),
        );
        _scaffoldStateKey.currentState.showSnackBar(snackBar);
      }
    }
  }

  Future<void> showLoadingIndicator() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 10.0,
                ),
                Text("Adding Food Item...")
              ],
            ),
          );
        });
  }

  Widget _buildTextFormField(String hint, {maxLine = 1}) {
    return TextFormField(
      decoration: InputDecoration(hintText: "$hint"),
      maxLines: maxLine,
      keyboardType: hint == "price" || hint == "Discount"
          ? TextInputType.number
          : TextInputType.text,
      validator: (String value) {
        if (value.isEmpty && hint == "Food Title") {
          return "The food title is required";
        }
        if (value.isEmpty && hint == "Category") {
          return "The food  category is required";
        }
        if (value.isEmpty && hint == "Description") {
          return "The food description is required";
        }
        if (value.isEmpty && hint == "Price") {
          return "The food price is required";
        }
      },
      onChanged: (String value) {
        if (hint == "Food Title") {
          title = value;
        }
        if (hint == "Category") {
          category = value;
        }
        if (hint == "Description") {
          description = value;
        }
        if (hint == "Price") {
          price = value;
        }
        if (hint == "Discount") {
          discount = value;
        }
      },
    );
  }
}
