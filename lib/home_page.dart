

import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var userQuestion = '';

var userAnswer = '';

final List<String> buttons = [
  'C',
  'DEL',
  '%',
  '/',
  '9',
  '8',
  '7',
  '*',
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
  '',
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
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(userAnswer,
                          style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
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
                        if (index == 0) {
                          return MyButton(
                              buttonTap: () {
                                setState(() {
                                  userQuestion = '';
                                });
                              },
                              color: const Color.fromARGB(255, 41, 226, 17),
                              textColor: Colors.white,
                              buttonText: buttons[index]);
                        } else if (index == 1) {
                          return MyButton(
                              buttonTap: () {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                });
                              },
                              color: const Color.fromARGB(255, 221, 36, 22),
                              textColor: Colors.white,
                              buttonText: buttons[index]);
                        } else if (index == buttons.length - 1) {
                          return MyButton(
                              buttonTap: () {
                                setState(() {
                                  equalButton();
                                });
                              },
                              color: const Color.fromARGB(255, 221, 36, 22),
                              textColor: Colors.white,
                              buttonText: buttons[index]);
                        } else {
                          return MyButton(
                              buttonTap: () {
                                setState(() {
                                  userQuestion += buttons[index];
                                });
                              },
                              color: isOperator(buttons[index])
                                  ? Colors.deepPurple
                                  : Colors.white,
                              textColor: isOperator(buttons[index])
                                  ? Colors.white
                                  : Colors.deepPurple,
                              buttonText: buttons[index]);
                        }
                      }))),
            ))
      ]),
    );
  }
}

bool isOperator(String x) {
  if (x == '%' || x == '/' || x == '+' || x == '-' || x == '=' || x == '*') {
    return true;
  }
  return false;
}

void equalButton() {
  String finalQuestion = userQuestion;

  Parser p = Parser();
  Expression exp = p.parse(finalQuestion);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  userAnswer = eval.toString();
}
