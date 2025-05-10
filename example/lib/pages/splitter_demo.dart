import 'package:flutter/material.dart';
import 'package:intl_ui/intl_ui.dart';

class SplitterDemo extends StatelessWidget {
  const SplitterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Splitter Demo")),
      body: Splitter(
        direction: Axis.horizontal,
        initialFirstFraction: 0.3,
        splitterDecoration: BoxDecoration(
          color: Colors.blue.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(2),
        ),
        child1: Container(color: Colors.red),
        child2: Splitter(
          direction: Axis.vertical,
          initialFirstFraction: 0.3,
          splitterDecoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(2),
          ),
          child1: Container(color: Colors.yellow),
          child2: Container(color: Colors.black),
        ),
      ),
    );
  }
}
