import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[150],
      body: Column(children: <Widget>[
        Expanded(child: Container()),
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.deepPurple,
              child: const Center(
                child: MyButtons(
                  buttonText: '0',
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                ),
              ),
            ))
      ]),
    );
  }
}
