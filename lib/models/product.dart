// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String id;
    String name;
    int stock;
    int price;
    String description;
    String thumbnail;
    String category;
    bool isFeatured;
    int user;
    String username;

    Product({
        required this.id,
        required this.name,
        required this.stock,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.isFeatured,
        required this.user,
        required this.username,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        stock: json["stock"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        isFeatured: json["is_featured"],
        user: json["user"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stock": stock,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "user": user,
        "username": username,
    };
}
