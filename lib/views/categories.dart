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
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: const Column(children: [
              Text("Welcome Back",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("It's meal time, let's cook",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ])),
        Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.red.withOpacity(.6),
                  const Color.fromARGB(255, 224, 28, 14).withOpacity(.8)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                // color: Color.fromARGB(255, 253, 151, 151),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 180,
                          child: const Text(
                              "You have a free meal, upon successful prep",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                              softWrap: true),
                        ),
                        const SizedBox(height: 5),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.white,
                                shape:
                                    CircleBorder(side: BorderSide(width: 5))),
                            onPressed: () => {},
                            child: const Text("Get Now!",
                                style: TextStyle(color: Colors.black))),
                      ]),
                  const Icon(Icons.cookie, size: 61, color: Colors.amber),
                ])),
        Container(
            height: 50,
            child: Expanded(
              child: GridView(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 120,
                      mainAxisExtent: 70,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 40,
                      childAspectRatio: .7),
                  children: Data()
                      .categoryInfo
                      .map((e) => InkWell(
                            onTap: () => mealFunc(context, e.title, e.id),
                            // clicking on each category calls a function which in turn
                            // navigates to a new page (pasted on current page)
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        e.color.withOpacity(.4),
                                        e.color
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(e.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                          ))
                      .toList()),
            )),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Text("Meals for the week",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        Container(
          height: 230,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Data().categoryInfo.length,
              itemBuilder: (BuildContext context, int ind) => Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      width: 160,
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(Data().categoryInfo[ind].image,
                              height: 105, width: 105, fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(Data().categoryInfo[ind].title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(Data().categoryInfo[ind].title,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 126, 125, 125),
                                  fontSize: 12)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("#39,000",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(Icons.add,
                                    color: Colors.white70))
                          ],
                        )
                      ])))),
        )
      ]));
}
