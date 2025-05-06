import 'package:flutter/material.dart';
import 'package:intl_ui/src/logger/logic/dio_logger_screen_logic.dart';
import 'package:intl_ui/src/logger/view/dio_logger_screen.dart';

class DioLoggerNavButton extends StatelessWidget {
  const DioLoggerNavButton({
    super.key,
    this.child = const Icon(Icons.network_check, color: Color(0xFF4CAf50)),
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
      icon: child,
    );
  }
}
