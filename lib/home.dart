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
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 900) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Info
                  Expanded(
                    child: Center(
                      child: Text('Info'),
                    ),
                  ),
                  SizedBox(width: 25),
                  //List
                  Expanded(
                    child: Center(
                      child: Text('List'),
                    ),
                  ),
                ],
              );
            } else {
              return PageView(
                children: const [
                  //Info
                  Expanded(
                    child: Center(
                      child: Text('Info'),
                    ),
                  ),
                  //List
                  Expanded(
                    child: Center(
                      child: Text('List'),
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
