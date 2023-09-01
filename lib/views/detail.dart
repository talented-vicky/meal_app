import 'package:flutter/material.dart';

import '../utils/constants/data.dart';

class Detail extends StatelessWidget {
  static const routeName = '/detail';
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    final selectedMeal =
        Data().mealInfo.firstWhere((elem) => elem.id == mealId);

    Widget titleText(title) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)));

    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
          backgroundColor: const Color.fromARGB(255, 245, 241, 241),
          foregroundColor: Colors.teal,
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: [
          Image.network(selectedMeal.imageUrl,
              height: 300, width: double.infinity, fit: BoxFit.cover),
          titleText("Ingredients"),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(color: Colors.black, width: .7)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            height: 160,
            width: 350,
            child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (BuildContext context, int ind) => Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: Container(
                          color: Colors.teal.withOpacity(.4),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 3),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(selectedMeal.ingredients[ind])),
                    )),
          ),
          titleText("Steps"),
          Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (BuildContext context, int ind) =>
                      Column(children: [
                        Container(
                          width: 300,
                          child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.teal.withOpacity(.8),
                                child: Text("# ${ind + 1}"),
                              ),
                              title: Text(selectedMeal.steps[ind])),
                        ),
                        Container(
                          child: const Text("Every step is equally important",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 14)),
                        ),
                      ])))
        ]))));
  }
}
