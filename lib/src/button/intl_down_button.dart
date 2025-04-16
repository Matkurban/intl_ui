import 'package:flutter/material.dart';
import 'package:intl_ui/intl_ui.dart';

/// A customizable down arrow button that supports internationalization
/// 一个支持国际化的可自定义下拉箭头按钮
class IntlDownButton extends StatelessWidget {
  /// Creates an IntlDownButton
  /// 创建一个国际化下拉按钮
  const IntlDownButton({
    super.key,
    this.onPressed,
    this.buttonWidth = double.infinity,
    required this.text,
    this.spacing = 6,
    this.isLtr = true,
    this.buttonHeight = 40,
    this.elevation = 0,
    this.horizontalPadding = 6,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.iconSize = 24,
    this.borderRadius,
    this.icon = const Icon(Icons.keyboard_arrow_down),
    this.border,
    this.textAlign = TextAlign.center,
    this.iconPosition = IconPosition.end,
  });

  /// Callback when button is pressed
  /// 按钮按下时的回调
  final VoidCallback? onPressed;

  /// Width of the button
  /// 按钮宽度
  final double buttonWidth;

  /// Text to display on the button
  /// 按钮上显示的文本
  final String text;

  /// Spacing between text and icon
  /// 文本和图标之间的间距
  final double spacing;

  /// Whether the layout direction is left to right
  /// 布局方向是否从左到右
  final bool isLtr;

  /// Height of the button
  /// 按钮高度
  final double buttonHeight;

  /// Elevation of the button
  /// 按钮阴影高度
  final double elevation;

  /// Horizontal padding of the button content
  /// 按钮内容的水平内边距
  final double horizontalPadding;

  /// Background color of the button
  /// 按钮的背景颜色
  final Color? backgroundColor;

  /// Foreground color of the button (affects text and icon color)
  /// 按钮的前景颜色（影响文本和图标颜色）
  final Color? foregroundColor;

  /// Text style for the button text
  /// 按钮文本的样式
  final TextStyle? textStyle;

  /// Size of the icon
  /// 图标的大小
  final double iconSize;

  /// Border radius of the button
  /// 按钮的圆角半径
  final BorderRadius? borderRadius;

  /// Custom icon widget
  /// 自定义图标组件
  final Widget icon;

  /// Border of the button
  /// 按钮的边框
  final BorderSide? border;

  /// Alignment of the text
  /// 文本的对齐方式
  final TextAlign textAlign;

  /// Position of the icon relative to the text
  /// 图标相对于文本的位置
  final IconPosition iconPosition;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      elevation: elevation,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      minimumSize: Size(buttonWidth, buttonHeight),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        side: border ?? BorderSide.none,
      ),
    );

    final textWidget = Expanded(
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: textStyle,
      ),
    );

    final iconWidget = IconTheme(
      data: IconThemeData(size: iconSize, color: foregroundColor),
      child: icon,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: IntlRow(
        isLtr: isLtr,
        spacing: spacing,
        children:
            iconPosition == IconPosition.start
                ? [iconWidget, textWidget]
                : [textWidget, iconWidget],
      ),
    );
  }
}

/// Defines the position of the icon relative to the text
/// 定义图标相对于文本的位置
enum IconPosition {
  /// Icon appears before the text
  /// 图标在文本之前
  start,

  /// Icon appears after the text
  /// 图标在文本之后
  end,
}
