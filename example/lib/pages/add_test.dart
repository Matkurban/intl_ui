import 'package:flutter/material.dart';
import 'package:intl_ui/intl_ui.dart';

class AddTest extends StatelessWidget {
  const AddTest({super.key, required this.isLtr});

  final bool isLtr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IntlAppBar(
        isLtr: isLtr,
        centerTitle: true,
        title: Text('Add Test'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.access_time)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit))],
      ),
    );
  }
}
