import 'package:flutter/material.dart';

class ProductModel {
  int quantity;
  List<String>? image;
  List<String>? image1;
  List<String>? image2;
  String path;
  String name;
  String selectsize;
  int price;
  String rating;
  bool smallavailable;
  bool largeavailable;
  bool xlavailable;
  bool mediumavailable;
  Color color1;
  Color color2;
  Color color3;
  String category;
  ProductModel(
      {required this.path,
      required this.name,
      required this.price,
      required this.rating,
      required this.smallavailable,
      required this.largeavailable,
      required this.mediumavailable,
      required this.xlavailable,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.category,
      this.image,
      this.selectsize = 's',
      this.image1,
      this.image2,
      this.quantity = 0});
}
