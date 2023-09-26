import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../models/meal.dart';
import '../utils/widgets/meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favMeal;
  const Favourites({super.key, required this.favMeal});

  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(80)),
                    child: Text(""),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 70,
                    child: Transform.rotate(
                      angle: 45 * math.pi / 180,
                      child: const Icon(Icons.note_alt,
                          size: 70, color: Color.fromARGB(255, 233, 230, 230)),
                    ),
                  ),
                  const Positioned(
                    left: 30,
                    child: Icon(Icons.note_alt,
                        size: 90, color: Color.fromARGB(255, 233, 230, 230)),
                  ),
                  const Positioned(
                    left: 85,
                    top: 2,
                    child: Icon(Icons.favorite_outlined,
                        size: 40, color: Colors.red),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                "Nothing in Favourite, yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: const Text(
                "Save Your Favourite Meals Here",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            Container(
                child: TextButton(
              onPressed: () {},
              child: const Text(
                "Start Adding",
                style: TextStyle(color: Colors.teal),
              ),
            )),
          ],
        ),
      );
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
