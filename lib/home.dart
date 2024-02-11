import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String title;
  const Home(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: const Center(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
