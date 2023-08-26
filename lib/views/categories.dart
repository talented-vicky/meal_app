import 'package:flutter/material.dart';

import './meals.dart';
import '../utils/constants/data.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  void mealFunc(BuildContext ctxt, title, id) => Navigator.of(ctxt).pushNamed(
        Meals.routeName,
        arguments: {'title': title, 'id': id},
      );
  // mealFunc navigates to a new page sending title and id from
  // Data().categoryInfo to the new page

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("new_app"),
        ),
        body: GridView(
            padding: const EdgeInsets.all(25),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 210,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: 1.8),
            children: Data().categoryInfo
                .map((e) => InkWell(
                      onTap: () => mealFunc(context, e.title, e.id),
                      // clicking on each category calls a function which in turn
                      // navigates to a new page (pasted on current page)
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
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)))),
                    ))
                .toList()),
      );
}
