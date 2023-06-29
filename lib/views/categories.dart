import 'package:flutter/material.dart';

import '../models/category.dart';
import '../views/meals.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  final List temp = [
    Category(id: "dui678d", title: "Amala & Ewedu", color: Colors.pink),
    Category(id: "9ijtg", title: "Ofada Rice", color: Colors.green),
    Category(id: "7yghYUY", title: "Fried Rice", color: Colors.orange),
    Category(id: "a12dxQ", title: "Cashew Soup"),
    Category(id: "67h", title: "Oha", color: Colors.tealAccent),
    Category(id: "0i8sdf", title: "Idikaikong", color: Colors.pink),
    Category(id: "al09s", title: "Banga", color: Colors.limeAccent),
    Category(id: "P76yhn", title: "Cashew Soup"),
    Category(id: "9k7erg", title: "Chinese Rice", color: Colors.purpleAccent),
    Category(id: "qaer98LP", title: "Singaporean Noodles", color: Colors.pink),
    Category(id: "kjgt57789", title: "Cray Kantey", color: Colors.blueAccent),
    Category(id: "87tgokjn", title: "Karee", color: Colors.amber),
    Category(id: "5679ij", title: "Gohan", color: Colors.tealAccent),
    Category(id: "o2ws0k", title: "Chikatetsu", color: Colors.redAccent),
    Category(id: "023edf", title: "Kuukou", color: Colors.deepPurple),
  ];

  void mealFunc(BuildContext ctxt, title, cont) {
    // Navigator.of(ctxt).push(
    //     MaterialPageRoute(builder: (_) => Meals(title: id, content: cont)));
    Navigator.of(ctxt).pushNamed(
      '/category',
      arguments: {'title': title, 'id': cont},
    );
  }

  @override
  Widget build(BuildContext context) => GridView(
      padding: const EdgeInsets.all(25),
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 210,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: 1.8),
      children: temp
          .map((e) => InkWell(
                onTap: () => mealFunc(context, e.title, e.id),
                child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [e.color.withOpacity(.4), e.color],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(e.title,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)))),
              ))
          .toList());
}
