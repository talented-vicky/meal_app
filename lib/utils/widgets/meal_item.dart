import 'package:flutter/material.dart';

import '../../models/meal.dart';
import '../../views/detail.dart';

class MealItem extends StatelessWidget {
  final String id, imageUrl, title;
  final int time;
  final Complexity comp;
  final Affordability afford;
  final Function togFav, favChk;
  const MealItem({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.comp,
    required this.afford,
    required this.togFav,
    required this.favChk,
  });

  String get compText {
    switch (comp) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.moderate:
        return 'Moderate';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordText {
    switch (afford) {
      case Affordability.cheap:
        return 'Cheap';
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.expensive:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void mealDetail(BuildContext ctxt, String id) {
    Navigator.of(ctxt).pushNamed(Detail.routeName, arguments: id
        // arguments: {"id": id} // object won't work here
        // saving id param passed from statelessW into mealDetail
        // function as key in the "arguments" object
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => mealDetail(context, id),
        // passing id param of statelessW into mealDetail function
        // along with the widget context
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            margin:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
            elevation: 2,
            child: Column(children: [
              Stack(children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    child: Image.network(
                      imageUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover, // maintain img resolution
                    )),
                Positioned(
                    top: 10,
                    right: 20,
                    child: IconButton(
                        focusColor: Colors.red.withOpacity(.2),
                        onPressed: () => togFav(id),
                        icon: Icon(Icons.star_border_rounded,
                            color: Color.fromARGB(255, 235, 43, 29)))),
                Positioned(
                    bottom: 50,
                    right: 5,
                    width: 250,
                    // no height to ensure fluidity, width ensures
                    // softWrap can take effect
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        color: Colors.black.withOpacity(.5),
                        child: Text(title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontStyle: FontStyle.italic),
                            // softWrap: false))),
                            softWrap: true))),
              ]),
              const SizedBox(height: 9),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(children: [
                          const Icon(Icons.alarm, color: Colors.teal),
                          Text("$time min")
                        ]),
                        Row(children: [
                          const Icon(Icons.apple, color: Colors.teal),
                          Text(compText)
                        ]),
                        Row(children: [
                          const Icon(Icons.monetization_on_outlined,
                              color: Colors.teal),
                          const SizedBox(width: 2),
                          Text(affordText)
                        ])
                      ]))
            ])));
  }
}
