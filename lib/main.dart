// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: MediaQueryData.fromWindow(window),
          child: SafeArea(
            child: ExamplesLayout(
              <Widget>[
                Example1(),
                Example2(),
                Example3(),
                Example4(),
                Example5(),
              ],
            ),
          ),
        ),
      );
}

class ExamplesLayout extends StatefulWidget {
  final List<Widget> examples;

  const ExamplesLayout(this.examples, {super.key});

  @override
  State<ExamplesLayout> createState() => _ExamplesLayoutState();
}

class _ExamplesLayoutState extends State<ExamplesLayout> {
  late int count = 1;
  late Widget example;

  void increment() {
    setState(() {
      if (count != widget.examples.length) {
        count++;
      }
    });
  }

  void decrement() {
    setState(() {
      if (count != 1) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox.expand(
            child: widget.examples[count - 1],
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              child: const Text('prev'),
              onPressed: () => decrement(),
            ),
            Text(
              '$count',
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            FloatingActionButton(
              child: const Text('next'),
              onPressed: () => increment(),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 40,
      width: 40,
    );
  }
}

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        width: 40,
        color: Colors.red,
      ),
    );
  }
}

class Example3 extends StatelessWidget {
  const Example3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
      ),
    );
  }
}

class Example4 extends StatelessWidget {
  const Example4({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // center le dice al hijo: "crecé tanto como quieras hasta w:390 y h:844"
      child: Container(
        // Container red dice: "okis, ya que tengo child le aviso a mi hijo 'Container blue' que sus constraints son maxWidth: 390 y maxHight: 844."
        color: Colors.red,
        child: Container(
          // Container blue dice: "Como no tengo child, quisiera expanderme lo más posible, entonces como vos Container red, padre mío, me dejás expandierme hasta un maxWidth de 390 y un maxHeigth de 844 voy a hacer eso."
          color: Colors.blue,
        ),
      ),
    );
  }
}

class Example5 extends StatelessWidget {
  const Example5({super.key});

  @override
  Widget build(BuildContext context) {
    // Switch between Column and Row
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.green),
          width: 60,
          height: 60,
        ),
        SizedBox(height: 20, width: 20),
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: Colors.green),
            width: 60,
            height: 6000, // These is ignored because of the Expanded parent.
          ),
        ),
      ],
    );
  }
}

class Example6 extends StatelessWidget {
  const Example6({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.green),
          width: 60,
          height: 60,
        ),
        SizedBox(height: 20),
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: Colors.green),
            width: 60,
            height: 10, // These is ignored because of the Expanded parent.
          ),
        ),
      ],
    );
  }
}
