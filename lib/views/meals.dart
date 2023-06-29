import 'package:flutter/material.dart';

class Meals extends StatelessWidget {
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = args['title'];
    final content = args['id'];
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(content),
      ),
    );
  }
}
