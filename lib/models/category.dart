import 'package:flutter/material.dart';

class Category {
  String id, title;
  Color color;
  Category({
    required this.id,
    required this.title,
    this.color = Colors.brown,
  });
}
