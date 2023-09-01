import 'package:flutter/material.dart';

import 'views/categories.dart';
import 'views/favourites.dart';
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
    {"view": Favourites(), "title": "Favourites"},
  ];

  int _tabInd = 0;

  void _tabSwitch(int ind) {
    setState(() => _tabInd = ind);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 245, 241, 241),
          foregroundColor: Colors.teal,
          title: Text(_tabs[_tabInd]["title"]),
          centerTitle: true,
        ),
        drawer: const DrawerWidget(),
        body: _tabs[_tabInd]["view"],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.teal,
          currentIndex: _tabInd,
          onTap: _tabSwitch,
          // backgroundColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_rounded), label: "Favourite"),
          ],
        ));
  }
}

// return DefaultTabController(
//   length: 2,
//   child: Scaffold(
//     appBar: AppBar(
//       title: const Text("dynamic stuff here"),
//       bottom: const TabBar(tabs: [
//         Tab(icon: Icon(Icons.category), text: "Categories"),
//         Tab(icon: Icon(Icons.star_rounded), text: "Favourites"),
//       ]),
//     ),
//     body: const TabBarView(children: [
//       Categories(),
//       Favourites(),
//     ]),
//   ),
// );