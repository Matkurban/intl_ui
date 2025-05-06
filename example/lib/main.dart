import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:example/custom/title_child_card.dart';
import 'package:flutter/material.dart';
import 'package:intl_ui/intl_ui.dart';

void main() {
  runApp(MyApp());
}

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

  final List<String> itemList = ["one", "two", "three", "four", "five", "six"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Intl UI Demo')),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          TitleChildCard(
            title: 'ToggleButtonGroup',
            child: ToggleButtonGroup(labels: itemList, onSelected: (index) {}),
          ),
          TitleChildCard(
            title: 'ToggleButtonGroupBuilder',
            child: ToggleButtonGroup(
              labels: itemList,
              size: 64,
              itemBuilder: (context, index, isSelect) {
                return Card(
                  color: isSelect ? Colors.blue : Colors.grey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 100,
                    ),
                    child: Center(child: Text(itemList[index])),
                  ),
                );
              },
              onSelected: (index) {},
            ),
          ),
          TitleChildCard(
            title: 'DottedDividerWidget',
            child: DottedDividerWidget(
              color: Colors.blue,
              strokeWidth: 6,
              dashSpace: 10,
            ),
          ),

          TitleChildCard(
            title: 'RadiusImage',
            child: RadiusImage(
              width: 300,
              height: 300,
              radius: 30,
              image: NetworkImage("https://picsum.photos/300"),
            ),
          ),

          TitleChildCard(
            title: 'JsonViewer',
            child: JsonViewer(jsonData: jsonDecode(jsonString)),
          ),
          TitleChildCard(
            title: 'DioLoggerScreen',
            child: ElevatedButton(
              onPressed: () {
                Dio dio = Dio();
                dio.interceptors.add(DioLoggerInterceptors());
                dio
                    .get('https://xxx.xxxx.com/api/v1/test')
                    .then((response) {
                      debugPrint(response.data.toString());
                    })
                    .catchError((error) {
                      debugPrint(error.toString());
                    });
              },
              child: Text('发送Dio请求'),
            ),
          ),
          TitleChildCard(
            title: 'DioLoggerNavButton',
            child: DioLoggerNavButton(),
          ),
        ],
      ),
    );
  }
}
