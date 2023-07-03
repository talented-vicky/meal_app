enum Complexity { simple, moderate, hard }

enum Affordability { cheap, affordable, expensive }

class Meal {
  final String id, title, imageUrl;
  final List<String> categoriesId, ingredients, steps;
  final bool isGlutenFree, isLactoseFree, isVegan, isVegetarian;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  Meal(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.categoriesId,
      required this.ingredients,
      required this.steps,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.duration,
      required this.complexity,
      required this.affordability});
}
