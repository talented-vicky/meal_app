import 'package:flutter/material.dart';

class Category {
  String id, title, image;
  Color color;
  Category({
    required this.id,
    required this.title,
    required this.image,
    this.color = Colors.brown,
  });
}
