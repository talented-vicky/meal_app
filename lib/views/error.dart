import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Oops! Something Went Wrong"),
        )
    );
  }
}