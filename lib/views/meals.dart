import 'package:flutter/material.dart';

import '../utils/widgets/meal_item.dart';
import '../models/meal.dart';

class Meals extends StatefulWidget {
  final List<Meal> availMeal;
  final Function toggleFav;
  final Function favCheck;
  static const routeName = '/category';
  const Meals(
      {super.key,
      required this.availMeal,
      required this.toggleFav,
      required this.favCheck});

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = args['title'];
    final itemId = args['id'];
    final filteredCat = widget.availMeal
        .where((catData) => catData.categoriesId.contains(itemId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 245, 241, 241),
        foregroundColor: Colors.teal,
      ),
      body: ListView.builder(
          itemCount: filteredCat.length,
          itemBuilder: (BuildContext context, int ind) => MealItem(
              togFav: widget.toggleFav,
              favChk: widget.favCheck,
              id: filteredCat[ind].id,
              imageUrl: filteredCat[ind].imageUrl,
              title: filteredCat[ind].title,
              time: filteredCat[ind].duration,
              comp: filteredCat[ind].complexity,
              afford: filteredCat[ind].affordability)),
    );
  }
}
