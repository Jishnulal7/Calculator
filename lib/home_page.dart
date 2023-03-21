import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var userQuestion = '12';

var userAnswer = '34';

final List<String> buttons = [
  'C',
  'DEL',
  '%',
  '/',
  '9',
  '8',
  '7',
  'x',
  '6',
  '5',
  '4',
  '-',
  '3',
  '2',
  '1',
  '+',
  '0',
  '.',
  'ANS',
  '='
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(children: <Widget>[
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      alignment: Alignment.centerLeft, child: Text(userQuestion,style: TextStyle(fontSize: 20),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      alignment: Alignment.centerRight, child: Text(userAnswer,style: TextStyle(fontSize: 20))),
                ),
              ],
            ),
          ),
        )),
        Expanded(
            flex: 2,
            child: Container(
              child: Center(
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: ((context, index) {
                        return MyButton(
                            color: isOperator(buttons[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            textColor: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.deepPurple,
                            buttonText: buttons[index]);
                      }))),
            ))
      ]),
    );
  }
}

bool isOperator(String x) {
  if (x == '%' || x == '/' || x == '+' || x == '-' || x == '=' || x == 'x') {
    return true;
  }
  return false;
}
