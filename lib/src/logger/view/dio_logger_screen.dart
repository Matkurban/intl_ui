import 'package:flutter/material.dart';
import 'package:intl_ui/src/logger/logic/dio_logger_screen_logic.dart';
import 'package:intl_ui/src/logger/widgets/logger_list_card.dart';

class DioLoggerScreen extends StatefulWidget {
  const DioLoggerScreen({super.key, required this.logic});

  final DioLoggerScreenLogic logic;

  @override
  State<DioLoggerScreen> createState() => _DioLoggerScreenState();
}

class _DioLoggerScreenState extends State<DioLoggerScreen> {
  @override
  void initState() {
    super.initState();
    widget.logic.onLogUpdated = () => setState(() {});
  }

  @override
  void dispose() {
    widget.logic.onLogUpdated = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Network Log')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          var item = widget.logic.logList.reversed.toList()[index];
          return LoggerListCard(
            item: item,
            onTap: () => widget.logic.toDetails(context, item),
          );
        },
        itemCount: widget.logic.logList.length,
      ),
    );
  }
}
