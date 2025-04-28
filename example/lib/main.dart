import 'dart:convert';

import 'package:example/custom/title_child_card.dart';
import 'package:example/pages/add_test.dart';
import 'package:flutter/material.dart';
import 'package:intl_ui/intl_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Intl Ui Demo",
      home: MyHomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          toolbarHeight: 48,
          iconTheme: AppBar().actionsIconTheme,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(iconSize: 24),
        ),
      ),
    );
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

  final String jsonString = '''
  {
    "name": "John",
    "age": 30,
    "city": "New York",
    "isMarried": false,
    "children": [
      {
        "name": "Anna",
        "age": 10
      },
      {
        "name": "Billy",
        "age": 5
      }
    ]
  }
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IntlAppBar(
        isLtr: isLtr,
        // leading: Row(children: [IntlBackButton(isLtr: isLtr)]),
        title: Text('Intl UI Demo'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AddTest(isLtr: isLtr);
                  },
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TitleChildCard(
              isLtr: isLtr,
              title: 'IntlDownButton',
              child: ToggleButtonGroup(
                labels: ["one", "two", "three", "four", "five", "six"],
                onSelected: (index) {},
              ),
            ),

            TitleChildCard(
              isLtr: isLtr,
              title: 'DottedDividerWidget',
              child: DottedDividerWidget(
                color: Colors.blue,
                strokeWidth: 6,
                dashSpace: 10,
              ),
            ),

            TitleChildCard(
              isLtr: isLtr,
              title: 'RadiusImage',
              child: RadiusImage(
                width: 300,
                height: 300,
                radius: 30,
                image: NetworkImage("https://picsum.photos/300"),
              ),
            ),

            TitleChildCard(
              isLtr: isLtr,
              title: 'IntlDownButton',
              child: IntlDownButton(
                text: 'Icon Text Button',
                isLtr: isLtr,
                onPressed: () {},
              ),
            ),

            TitleChildCard(
              isLtr: isLtr,
              title: 'IntlBackButton',
              child: IntlBackButton(isLtr: isLtr),
            ),

            TitleChildCard(
              isLtr: isLtr,
              title: 'IntlListTile',
              child: IntlListTile(
                isLtr: isLtr,
                title: Text('IntlListTile'),
                leading: Icon(Icons.account_circle_outlined),
                trailing: Icon(Icons.ac_unit),
                onTap: () {},
              ),
            ),

            TitleChildCard(
              isLtr: isLtr,
              title: 'IntlRadioListTile',
              child: IntlRadioListTile<bool>(
                isLtr: isLtr,
                title: Text('IntlListTile'),
                trailing: Icon(Icons.ac_unit),
                value: true,
                groupValue: true,
                onChanged: (bool? value) {},
                onTap: () {},
              ),
            ),

            TitleChildCard(
              isLtr: isLtr,
              title: 'IntlRow',
              child: IntlRow(
                isLtr: isLtr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('left'), Text('right')],
              ),
            ),

            TitleChildCard(
              isLtr: isLtr,
              title: 'IntlWrap',
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  var cardWidth = (constraints.maxWidth - 20) / 3;
                  return IntlWrap(
                    isLtr: isLtr,
                    spacing: 10,
                    runSpacing: 10,
                    step: 3,
                    children: List.generate(20, (index) {
                      return Container(
                        width: cardWidth,
                        height: cardWidth,
                        color: Colors.blue,
                        child: Center(child: Text('Item $index')),
                      );
                    }),
                  );
                },
              ),
            ),
            TitleChildCard(
              title: 'JsonViewer',
              child: JsonViewer(jsonData: jsonDecode(jsonString)),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: toggleLayout,
        child: Icon(isLtr ? Icons.toggle_on : Icons.toggle_off),
      ),
    );
  }
}
