import 'package:flutter/material.dart';

import 'views/categories.dart';
import 'views/favourites.dart';
import 'views/cart.dart';
import './utils/widgets/drawer.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});
  static const routeName = '/tabs';

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final List<Map<String, dynamic>> _tabs = const [
    {"view": Categories(), "title": "Categories"},
    {"view": Cart(), "title": "Cart"},
    {"view": Favourites(), "title": "Favourites"},
  ];

  int _tabInd = 0;

  void _tabSwitch(int ind) {
    setState(() => _tabInd = ind);
    print(ind);
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
