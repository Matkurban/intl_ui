import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_ui/intl_ui.dart';

class ResponsePane extends StatelessWidget {
  const ResponsePane({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: JsonViewer(
        jsonData: data,
        onLongPress: () {
          ///复制到剪切板
          Clipboard.setData(ClipboardData(text: jsonEncode(data)));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('复制成功'), duration: Duration(seconds: 2)),
          );
        },
      ),
    );
  }
}
