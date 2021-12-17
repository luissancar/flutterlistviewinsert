import 'package:flutter/material.dart';
import 'lista.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int contador = 6;

  void anadir() {
    setState(() {
      lista.add("elemento nuevo $contador");
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter listview',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ListView"),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              anadir();
            }),
        body: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, position) {
            return Item(lista[position]);
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Item extends StatelessWidget {
  String item;

  Item(this.item) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        item,
        textAlign: TextAlign.center,
      ),
      onTap: () {
        // ignore: avoid_print
        print("Pulsado $item");
      },
      onLongPress: () {
        // ignore: avoid_print
        print("Largo click $item");
      },
    );
  }
}
