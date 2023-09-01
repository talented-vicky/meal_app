import 'package:flutter/material.dart';

import '../utils/widgets/drawer.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});
  static const routeName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 241, 241),
        foregroundColor: Colors.teal,
        title: const Text("Filter"),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: const Center(
        child: Text("stuff"),
      ),
    );
  }
}
