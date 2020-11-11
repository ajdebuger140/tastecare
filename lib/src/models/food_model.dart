//class Food {
//  final String id;
//  final String name;
//  final String description;
//  final String imagePath;
//  final String category;
//  final double price;
//  final double discount;
//  final double ratings;
//
//  Food({
//    this.id,
//    this.name,
//    this.imagePath,
//    this.category,
//    this.description,
//    this.price,
//    this.discount,
//    this.ratings,
//  });
//}

class Food {
  String id;
  String name;
  String description;
  String imagePath;
  String category;
  double price;
  double discount;
  double ratings;

  Food(
      {this.id,
        this.name,
        this.description,
        this.imagePath,
        this.category,
        this.price,
        this.discount,
        this.ratings});

  Food.fromJson(Map<String, dynamic> json, id) {
    name = json['name'];
    description = json['description'];
    imagePath = json['imagePath'];
    category = json['category'];
    price = json['price'];
    discount = json['discount'];
    ratings = json['ratings'];
    this.id = id;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['imagePath'] = this.imagePath;
    data['category'] = this.category;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['ratings'] = this.ratings;
    return data;
  }
}

