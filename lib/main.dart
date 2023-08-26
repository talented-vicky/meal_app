import 'package:flutter/material.dart';

import './views/categories.dart';
import './views/meals.dart';
import './views/detail.dart';
import './views/error.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Categories(),
      routes: {
        '/': (ctx) => const Categories(),
        Meals.routeName: (ctx) => const Meals(),
        Detail.routeName: (ctx) => const Detail(),
      },
      onUnknownRoute: (sett) {
        return MaterialPageRoute(builder: (ctx) => const ErrorPage());
      },
    );
  }
}

// I surrender all to you | i give myself away | Daily as I live | You are the reason I live | Lord I give you my heart => EBEZENA

/* 
to dream withoug borders or boundaries, to seek adventure,
to obsess and create => the world IMPOSSIBLE doesn't have to exist
*/

// check database for african dishes