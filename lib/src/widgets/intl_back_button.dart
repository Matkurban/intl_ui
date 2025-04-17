import 'package:flutter/material.dart';

/// A back button widget with customizable icons, colors, and direction support.
/// 支持自定义图标、颜色和方向的返回按钮小部件。

class IntlBackButton extends StatelessWidget {
  const IntlBackButton({
    super.key,
    this.color,
    this.isLtr = true,
    this.leftIcon = Icons.keyboard_arrow_left,
    this.rightIcon = Icons.keyboard_arrow_right,
    this.iconSize,
    this.onPressed,
  });

  /// Whether the layout is left-to-right (LTR). Defaults to true.
  /// 布局是否为从左到右（LTR）。默认为 true。
  final bool isLtr;

  /// The color of the button icon. Defaults to the AppBar's foreground color.
  /// 按钮图标的颜色。默认为 AppBar 的前景颜色。
  final Color? color;

  /// The icon for the left direction (used in LTR layout).
  /// 左向图标（用于 LTR 布局）。
  final IconData leftIcon;

  /// The icon for the right direction (used in RTL layout).
  /// 右向图标（用于 RTL 布局）。
  final IconData rightIcon;

  /// The size of the button icon. Defaults to 26.
  /// 按钮图标的大小。默认为 26。
  final double? iconSize;

  /// The callback function executed when the button is pressed.
  /// Defaults to popping the current navigation stack.
  /// 按钮被按下时执行的回调函数。默认为弹出当前导航堆栈。
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // Use the provided onPressed callback or default to Navigator.pop.
      // 使用提供的 onPressed 回调函数，若未提供则默认执行 Navigator.pop。
      onPressed: onPressed ?? () => Navigator.pop(context),
      icon: Icon(
        // Use leftIcon for LTR or rightIcon for RTL layout.
        // 对于 LTR 布局使用 leftIcon，对于 RTL 布局使用 rightIcon。
        isLtr ? leftIcon : rightIcon,
        // Use the provided color or the AppBar's default foreground color.
        // 使用提供的颜色，若未提供则使用 AppBar 的默认前景颜色。
        color: color ?? Theme.of(context).appBarTheme.foregroundColor,
        // Set the size of the icon.
        // 设置图标的大小。
        size: iconSize ?? IconThemeData().size,
      ),
    );
  }
}
