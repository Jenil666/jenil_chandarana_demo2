// To parse this JSON data, do
//
//     final productModal = productModalFromJson(jsonString);

import 'dart:convert';

ProductModal productModalFromJson(String str) => ProductModal.fromJson(json.decode(str));

String productModalToJson(ProductModal data) => json.encode(data.toJson());

class ProductModal {
  List<ProductDatum>? productData;

  ProductModal({
    this.productData,
  });

  factory ProductModal.fromJson(Map<String, dynamic> json) => ProductModal(
    productData: json["ProductData"] == null ? [] : List<ProductDatum>.from(json["ProductData"]!.map((x) => ProductDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ProductData": productData == null ? [] : List<dynamic>.from(productData!.map((x) => x.toJson())),
  };
}

class ProductDatum {
  String? id;
  String? categoryName;
  String? name;
  String? price;
  String? image;
  String? averageRating;

  ProductDatum({
    this.id,
    this.categoryName,
    this.name,
    this.price,
    this.image,
    this.averageRating,
  });

  factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
    id: json["Id"],
    categoryName: json["CategoryName"],
    name: json["Name"],
    price: json["Price"],
    image: json["Image"],
    averageRating: json["AverageRating"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "CategoryName": categoryName,
    "Name": name,
    "Price": price,
    "Image": image,
    "AverageRating": averageRating,
  };
}
