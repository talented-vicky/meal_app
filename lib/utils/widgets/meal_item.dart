import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String imageUrl, title, time, comp, afford;
  const MealItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.time,
      required this.comp,
      required this.afford});

  void funcUse() {}

  void addFav() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => funcUse,
        child: Column(children: [
          Stack(children: [
            // cliprrect borderRad only
            // topleft and topright
            // Image.network(
            //   imageUrl,
            //   height: 200,
            //   // width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            Container(
              height: 200,
              width: double.infinity,
              child: const Text("S"),
            ),
            Positioned(
                top: 10,
                right: 20,
                child: IconButton(
                    focusColor: Colors.red.withOpacity(.2),
                    onPressed: () => addFav,
                    icon: const Icon(
                      Icons.star_border_rounded,
                      color: Color.fromARGB(255, 235, 43, 29),
                    ))),
            Positioned(
                top: 100,
                child: Container(
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: Text(title,
                        style: const TextStyle(
                            fontSize: 19, fontStyle: FontStyle.italic),
                        softWrap: true))),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(children: [
              const Icon(Icons.watch_later_outlined, color: Colors.blueAccent),
              Text(time)
            ]),
            Row(children: [
              const Icon(Icons.shopping_bag_rounded, color: Colors.blueAccent),
              Text(comp)
            ]),
            Row(children: [
              const Icon(Icons.attach_money_sharp, color: Colors.blueAccent),
              Text(afford)
            ])
          ])
        ]));
  }
}
