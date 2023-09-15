import 'package:flutter/material.dart';

import '../utils/widgets/drawer.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 241, 241),
        foregroundColor: Colors.teal,
        title: const Text("Cart"),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: const Center(
        child: Text("Some meals in cart"),
      ),
    );
  }
}
