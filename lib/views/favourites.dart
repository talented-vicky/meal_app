import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../utils/widgets/meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favMeal;
  const Favourites({super.key, required this.favMeal});

  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return const Center(child: Text("No favourite meal yet!"));
    } else {
      return Container(
        height: 600,
        child: ListView.builder(
            itemCount: favMeal.length,
            itemBuilder: (BuildContext context, int ind) => MealItem(
                togFav: () => {},
                favChk: () => {},
                // make the functions active again, casue I should be
                //// able to easily remove an item from favourite list
                /// from here
                id: favMeal[ind].id,
                imageUrl: favMeal[ind].imageUrl,
                title: favMeal[ind].title,
                time: favMeal[ind].duration,
                comp: favMeal[ind].complexity,
                afford: favMeal[ind].affordability)),
      );
    }
  }
}
