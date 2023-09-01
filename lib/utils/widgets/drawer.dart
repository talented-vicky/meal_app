import 'package:flutter/material.dart';

import '../../views/filter.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  Widget tilerBuilder(text, IconData icon, VoidCallback trigger) => ListTile(
      leading: Icon(icon),
      onTap: trigger,
      title: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)));

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 245, 241, 241)),
            padding: const EdgeInsets.symmetric(vertical: 19),
            child: const Text("AMAZING MEALS!",
                style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 15),
          tilerBuilder(
            "Meals",
            Icons.restaurant_menu_rounded,
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          tilerBuilder(
            "Filters",
            Icons.settings,
            () => Navigator.of(context).pushReplacementNamed(Filter.routeName),
          ),
        ],
      ),
    );
  }
}
