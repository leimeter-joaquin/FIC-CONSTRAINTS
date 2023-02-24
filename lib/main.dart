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
      if (count < widget.examples.length) {
        count++;
      }
    });
  }

  void decrement() {
    setState(() {
      if (count >= widget.examples.length) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
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
              style: const TextStyle(color: Colors.red),
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
        color: Colors.green,
      ),
    );
  }
}
