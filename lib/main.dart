import 'package:flutter/material.dart';

import '/tabs.dart';
import 'views/meals.dart';
import 'views/detail.dart';
import 'views/filter.dart';
import 'views/cart.dart';

import './models/meal.dart';
import './utils/constants/data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "vegan": false,
    "lactose": false,
    "gluten": false,
    "vegetarian": false,
  };

  List<Meal> stuff = Data;

  void _filterMeal(Map<String, bool> mealData) {
    setState(() => _filters = mealData);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => const Tabs(),
        Meals.routeName: (ctx) => const Meals(),
        Detail.routeName: (ctx) => const Detail(),
        Filter.routeName: (ctx) => Filter(
              filtFunc: _filterMeal,
            ),
        Cart.routeName: (ctx) => const Cart()
      },
      onUnknownRoute: (sett) =>
          MaterialPageRoute(builder: (ctx) => const Meals()));
}

// IMPORTANT
// change the category (home page)
// I surrender all to you | i give myself away | Daily as I live | You are the reason I live | Lord I give you my heart => EBEZENA

/* 
to dream withoug borders or boundaries, to seek adventure,
to obsess and create => the world IMPOSSIBLE doesn't have to exist
*/

// check database for african dishes