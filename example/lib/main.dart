import 'package:flutter/material.dart';
import 'package:intl_ui/intl_ui.dart';

void main() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Intl Ui Demo", home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLtr = true;

  void toggleLayout() {
    setState(() {
      isLtr = !isLtr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IntlAppBar(
        isLtr: isLtr,
        leading: IntlBackButton(),
        actions: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleLayout,
        child: Icon(isLtr ? Icons.toggle_on : Icons.toggle_off),
      ),
    );
  }
}
