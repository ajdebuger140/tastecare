import 'package:flutter/material.dart';
import 'package:foodapp/src/widgets/button.dart';

class FoodOrderdeatil extends StatefulWidget {
  FoodOrderdeatil({Key key}) : super(key: key);

  @override
  _FoodOrderdeatilState createState() => _FoodOrderdeatilState();
}

class _FoodOrderdeatilState extends State<FoodOrderdeatil> {
  String name;
  String conatact;
  String quantity;
  String address;
  GlobalKey<FormState> _foodItemFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
          child: Form(
            key: _foodItemFormKey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  width: MediaQuery.of(context).size.width,
                  height: 0.0,
                ),
                _buildTextFormField("Delivery Adress"),
                _buildTextFormField("Quantity"),
                _buildTextFormField("Contact number"),
                SizedBox(height: 100.0),
                Button(
                  btnText: "Submitt to  Order",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String hint, {maxLine = 1}) {
    return TextFormField(
      decoration: InputDecoration(hintText: "$hint"),
      maxLines: maxLine,
      keyboardType: hint == "address" || hint == "Discount"
          ? TextInputType.number
          : TextInputType.text,
      validator: (String value) {
        if (value.isEmpty && hint == "Address") {
          return "Delivey address is required";
        }
        if (value.isEmpty && hint == "Contact Number") {
          return "Contact Number is required";
        }
        if (value.isEmpty && hint == "Quantity") {
          return "Quantity is required";
        }
        if (value.isEmpty && hint == "Food Name") {
          return "The Food Name is required";
        }
      },
      onChanged: (String value) {
        if (hint == "Food Name") {
          name = value;
        }
        if (hint == "") {
          conatact = value;
        }
        if (hint == "Description") {
          quantity = value;
        }
        if (hint == "Discount") {
          address = value;
        }
      },
    );
  }
}
