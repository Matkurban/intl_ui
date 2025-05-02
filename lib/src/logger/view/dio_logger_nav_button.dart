import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl_ui/src/logger/view/dio_logger_screen.dart';
import 'package:intl_ui/src/logger/logic/dio_logger_screen_logic.dart';

class DioLoggerNavButton extends StatelessWidget {
  const DioLoggerNavButton({
    super.key,
    this.child = const Icon(CupertinoIcons.globe, color: Color(0xFF4CAf50)),
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'dioLoggerNavButton', // 添加唯一的 Hero 标签
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DioLoggerScreen(logic: DioLoggerScreenLogic.instance);
            },
          ),
        );
      },
      child: child,
    );
  }
}
