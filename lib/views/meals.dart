import 'package:flutter/material.dart';

import '../utils/constants/data.dart';
import '../utils/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  static const routeName = '/category';
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = args['title'];
    final itemId = args['id'];
    final filteredCat = Data()
        .mealInfo
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
              id: filteredCat[ind].id,
              imageUrl: filteredCat[ind].imageUrl,
              title: filteredCat[ind].title,
              time: filteredCat[ind].duration,
              comp: filteredCat[ind].complexity,
              afford: filteredCat[ind].affordability)),
    );
  }
}
