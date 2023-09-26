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
  Map<String, dynamic> _filters = {
    "vegan": false,
    "lactose": false,
    "gluten": false,
    "vegetarian": false,
  };

  List<Meal> _filteredMeals = Data().mealInfo;
  List<Meal> _favouriteMeals = [];

  void _filterMeal(Map<String, dynamic> mealData) {
    setState(() {
      _filters = mealData;
      _filteredMeals = Data().mealInfo.where((elem) {
        if (_filters['vegan'] && !elem.isVegan) {
          // check if the filter is set to "vegan" which corresponds
          // to a default false value of the key, and also check if the
          // meal in question is vegan free
          return false;
        } else if (_filters['lactose'] && !elem.isLactoseFree) {
          return false;
        } else if (_filters['gluten'] && !elem.isGlutenFree) {
          return false;
        } else if (_filters['vegetarian'] && !elem.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFav(String mealId) {
    final existingInd = _favouriteMeals.indexWhere((elem) => elem.id == mealId);
    // the above will be -1 if the index wasn't found

    if (existingInd >= 0) {
      // meal already exists, hence pop it out
      setState(() {
        _favouriteMeals.removeAt(existingInd);
      });
    } else {
      // i.e if we get -1, which means meal doesn't exist
      setState(() {
        _favouriteMeals
            .add(Data().mealInfo.firstWhere((elem) => elem.id == mealId));
      });
    }
  }

  bool _checkFav(String mealId) {
    return _favouriteMeals.any((elem) => elem.id == mealId);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => Tabs(favMeals: _favouriteMeals),
        // passing a list of favmeals into the tabs screen so as
        // to then pass it into the Favourite widget
        Meals.routeName: (ctx) => Meals(
              availMeal: _filteredMeals,
              toggleFav: _toggleFav,
              favCheck: _checkFav,
            ),
        // the _filteredMeals list changes whenever the Filter widget is
        // navigated to and a filter turned on or off
        Detail.routeName: (ctx) => const Detail(),
        Filter.routeName: (ctx) => Filter(
              filtFunc: _filterMeal,
              filtState: _filters,
            ),
        // Filter() requires/expects a function as its argument
        // and I am curently passing _filterMeal as this required
        // function, when this is done set state updates the
        //  _filteredMeals list I am passing into the Meals widget
        Cart.routeName: (ctx) => const Detail()
      },
      onUnknownRoute: (sett) =>
          MaterialPageRoute(builder: (ctx) => const Cart()));
}

// IMPORTANT
// I surrender all to you | i give myself away | Daily as I live | You are the reason I live | Lord I give you my heart => EBEZENA

/* 
to dream withoug borders or boundaries, to seek adventure,
to obsess and create => the world IMPOSSIBLE doesn't have to exist
*/

// check database for african dishes
