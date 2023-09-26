import 'package:flutter/material.dart';

import 'views/categories.dart';
import 'views/favourites.dart';
import 'views/cart.dart';
import './utils/widgets/drawer.dart';
import './models/meal.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key, required this.favMeals});
  final List<Meal> favMeals;

  static const routeName = '/tabs';

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // List<Map<String, dynamic>> _tabs = [
  //   {"view": const Categories(), "title": "Categories"},
  //   {"view": const Cart(), "title": "Cart"},
  //   // I now forward the list of fav meals (now present in tabs widget)
  //   // into the Favourites widget
  //   {"view": Favourites(favMeal: widget.favMeals), "title": "Favourites"},
  // ];
  // at this point, the creation of this class isn't fully finished, hence
  // inability to call widget.favMeals here, that's why I had to resort
  // to using initState to do so

  // List<Map<String, dynamic>> _tabs = [];
  late List<Map<String, dynamic>> _tabs;

  int _tabInd = 0;
  void _tabSwitch(int ind) => setState(() => _tabInd = ind);

  @override
  void initState() {
    super.initState();
    _tabs = [
      {"view": const Categories(), "title": "Home"},
      {"view": const Cart(), "title": "Cart"},
      // I now forward the list of fav meals (now present in tabs widget)
      // into the Favourites widget
      {"view": Favourites(favMeal: widget.favMeals), "title": "Favourites"},
    ];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 241, 241),
        foregroundColor: Colors.teal,
        title: Text(_tabs[_tabInd]["title"]),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: _tabs[_tabInd]["view"],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.teal,
        currentIndex: _tabInd,
        onTap: _tabSwitch,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_rounded), label: "Favourite"),
        ],
      ));
}
