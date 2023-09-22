import 'dart:ffi';

import 'package:flutter/material.dart';

import '../utils/widgets/drawer.dart';

class Filter extends StatefulWidget {
  final Function filtFunc;
  final Map<String, dynamic> filtState;
  // anytime I call this widget (Filter), I expect a function which I
  // pass into the onchanged key of the appbar action's iconbutton

  const Filter({super.key, required this.filtFunc, required this.filtState});
  static const routeName = '/filter';

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _isLactoseFree = false;
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    super.initState();
    // overriding the bool values with the values of the object I pass
    // into this widget whenever I call it
    _isVegan = widget.filtState['vegan'];
    _isLactoseFree = widget.filtState['lactose'];
    _isGlutenFree = widget.filtState['gluten'];
    _isVegetarian = widget.filtState['vegetarian'];
  }

  // predefining reusable widget for switchlisttile
  Widget _switchTile(
    bool currBool,
    String title,
    String subtitle,
    Function func,
  ) =>
      SwitchListTile(
        value: currBool,
        onChanged: (currBool) => func,
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
                  onPressed: () {
                    final mealFilter = {
                      "vegan": _isVegan,
                      "lactose": _isLactoseFree,
                      "gluten": _isGlutenFree,
                      "vegetarian": _isVegetarian,
                    };
                    widget.filtFunc(mealFilter);
                    // when this is clicked, I call the function passed
                    // into this widget (Filter) with the mealFilter object
                    // as its parameter but the values in this object will
                    // be constantly changing

                    // this triggers the filterMeal function in the main
                    // file where routing to "this widget" is done
                  },
                  icon: const Icon(Icons.save_as))
            ]),
        drawer: const DrawerWidget(),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text("Change Meal Selection",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial')),
            ),
            Expanded(
                child: ListView(
              children: [
                _switchTile(
                    _isVegan,
                    "Vegan-Free",
                    "Remove meals with Vegan content",
                    (value) => setState(() => _isVegan = value)),
                _switchTile(
                    _isLactoseFree,
                    "Lactose-Free",
                    "Meals with little or no lactose",
                    (value) => setState(() => _isLactoseFree = value)),
                _switchTile(
                    _isGlutenFree,
                    "Gluten-Free",
                    "Ensure to remove all gluten meals",
                    (value) => setState(() => _isGlutenFree = value)),
                _switchTile(
                    _isVegetarian,
                    "Vegetarian-Free",
                    "I am not a vegetarian",
                    (value) => setState(() => _isVegetarian = value)),
              ],
            ))
          ],
        ));
  }
}
