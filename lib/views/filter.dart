import 'package:flutter/material.dart';

import '../utils/widgets/drawer.dart';

class Filter extends StatefulWidget {
  final Function filtFunc;
  const Filter({super.key, required this.filtFunc});
  static const routeName = '/filter';

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _isLactoseFree = false;
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  Widget _switchTile(
    bool currBool,
    String title,
    String subtitle,
    Function func,
  ) =>
      SwitchListTile(
        value: currBool,
        onChanged: func,
        title: Text(title),
        subtitle: Text(subtitle),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 245, 241, 241),
          foregroundColor: Colors.teal,
          title: const Text("Filter"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: widget.filtFunc,
              icon: const Icon(Icons.save_as),
            )
          ],
        ),
        drawer: const DrawerWidget(),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                "Change Meal Selection",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial'),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _switchTile(
                    _isLactoseFree,
                    "Lactose-Free",
                    "Meals with little or no lactose",
                    (value) => setState(() => _isLactoseFree = value)),
                _switchTile(
                    _isVegan,
                    "Vegan-Free",
                    "Remove meals with Vegan content",
                    (value) => setState(() => _isVegan = value)),
              ],
            ))
          ],
        ));
  }
}
