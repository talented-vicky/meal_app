import 'package:flutter/material.dart';

import '/tabs.dart';
import 'views/meals.dart';
import 'views/detail.dart';
import 'views/filter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => const Tabs(),
        Meals.routeName: (ctx) => const Meals(),
        Detail.routeName: (ctx) => const Detail(),
        Filter.routeName: (ctx) => const Filter()
      },
      onUnknownRoute: (sett) =>
          MaterialPageRoute(builder: (ctx) => const Filter()));
}

// IMPORTANT
// change the category (home page)
// I surrender all to you | i give myself away | Daily as I live | You are the reason I live | Lord I give you my heart => EBEZENA

/* 
to dream withoug borders or boundaries, to seek adventure,
to obsess and create => the world IMPOSSIBLE doesn't have to exist
*/

// check database for african dishes