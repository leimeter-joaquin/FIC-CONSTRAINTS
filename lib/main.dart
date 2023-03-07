// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                Example6(),
                Example7(),
                Example8(),
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
  late int index = 1;
  late Widget example;

  void increment() {
    setState(() {
      if (index != widget.examples.length) {
        index++;
      }
    });
  }

  void decrement() {
    setState(() {
      if (index != 1) {
        index--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox.expand(
            //! This sized box serves as an example of a parent that forces the child to occupy all of the spance, horizontaly and vertically, like the root widget does. No need to go into SizedBox now.
            child: widget.examples[index - 1],
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
              '$index',
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
      height:
          40, //* Explain that the width is not taken into account because the Parent widget tells the child to occupy the whole space overriding these properties.
      width: 40,
    );
  }
}

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors
              .transparent), //** Cambiar el bg para mostrar e lugar que ocupa el center.
      child: Center(
        //* El widget Center te deja posicionar un hijo dentro de la forma que quieras. El widget Center se expande para cubrir toda el area disponible. Podríamos usar un UnconstrainedBox en su lugar.
        child: Container(
          height: 40,
          width: 40,
          color: Colors.red,
        ),
      ),
    );
  }
}

class Example3 extends StatelessWidget {
  const Example3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // TODO: add comments explaining behavior.
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
      //* center le dice al hijo: "crecé tanto como quieras hasta w:390 y h:844"
      child: Container(
        //* Container red dice: "okis, ya que tengo child le aviso a mi hijo 'Container blue' que sus constraints son maxWidth: 390 y maxHight: 844."
        color: Colors.red,
        child: Container(
          //* Container blue dice: "Como no tengo child no voy a tener que pasar ningun constraint hacia abajo, quisiera expanderme lo más posible, entonces como vos Container red, padre mío, me dejás expandierme hasta un maxWidth de 390 y un maxHeigth de 844 voy a hacer eso."
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
    return Center(
      //* center le dice al hijo: "crecé tanto como quieras hasta w:390 y h:667"
      child: Container(
        //* Container red dice: "okis, ya que tengo child le aviso a mi hijo 'Container blue' que sus constraints son maxWidth: 390 y maxHight: 844."
        color: Colors.red,
        child: Container(
          //* Container blue dice: "Como no tengo child, no tengo que pasar constraints hacia abajo PERO si tengo un height declarado, por esta razón voy a tener esa altura pero voy a expandirme lo más posible hacia los costados."
          color: Colors.blue,
          height: 20,
        ),
      ),
    );
  }
}
//* Tener en cuenta que un Container renderiza un ConstrainedBox cuando tiene un height o width seteado.

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
        SizedBox(height: 20), //* Show usage of gap library.
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: Colors.orange),
            width: 60,
            height: 10, //! These is ignored because of the Expanded parent.
          ),
        ),
      ],
    );
  }
}

/// Overflow of text and how to solve it with Expanded widget + text style + first time showing padding.
class Example7 extends StatelessWidget {
  const Example7({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.pink[100],
        child: Row(
          children: [
            //* Wrap text with expanded widget to solve this issue.
            //! The Expanded widget works as a child of Flex, Row or Column. It lets it's (Expanded's) children to occupy the whole space in the main axis but no more.
            Text(
              'Lorem Overflow ipsum haha test1 test2 test3 test4 test5 test6 test7 test8 test9',
              style: TextStyle(color: Colors.grey[800]),
              //* maxLines: 1, //* add this after using expanded widget
              //* overflow: TextOverflow.ellipsis, //* add this to show ellipsis
            ), //* inspect widget.
          ],
        ),
      ),
    );
  }
}

/// State and Image assets usage.
class Example8 extends StatefulWidget {
  const Example8({super.key});

  @override
  State<Example8> createState() => _Example8State();
}

class _Example8State extends State<Example8> {
  Color color = Colors.white;

  void toggleColor() {
    setState(() {
      if (color == Colors.white) {
        color = Colors.red;
        return;
      }
      color = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('lib/assets/cute-dog.jpg'),
        ),
        Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Some image'),
              Icon(Icons.star, color: color),
            ],
          ),
        ),
        Gap(20),
        TextButton(
          onPressed: toggleColor,
          child: const Text('Toggle'),
        )
      ],
    );
  }
}
