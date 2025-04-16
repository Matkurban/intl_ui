import 'package:flutter/material.dart';
import 'package:intl_ui/src/widgets/intl_row.dart';

/// A custom AppBar widget with enhanced flexibility and layout options.
/// 自定义的应用栏部件，提供增强的灵活性和布局选项。

class IntlCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const IntlCustomAppBar({
    super.key,
    required this.isLtr,
    this.leading,
    required this.title,
    this.actions,
    this.bottom,
    this.toolbarHeight = 48,
    this.centerTitle = true,
    this.titleSpacing = 10,
    this.leadingWidth = 48,
    this.actionsWidth = 48,
    this.backgroundColor,
    this.titleBottomSpacing = 0,
  });

  /// Whether the layout is left-to-right (LTR).
  /// 布局是否为从左到右（LTR）。
  final bool isLtr;

  /// The widget displayed on the leading side (e.g., back button).
  /// 应用栏左侧显示的控件（例如返回按钮）。
  final Widget? leading;

  /// The widget displayed as the title in the center of the AppBar.
  /// 应用栏中间显示的标题控件。
  final Widget title;

  /// The widget displayed on the trailing side, typically action buttons.
  /// 应用栏右侧显示的控件，通常是操作按钮。
  final Widget? actions;

  /// The widget displayed at the bottom of the AppBar, such as a tab bar.
  /// 应用栏底部显示的控件，例如选项卡。
  final PreferredSizeWidget? bottom;

  /// The height of the AppBar's toolbar section.
  /// 应用栏工具栏部分的高度。
  final double toolbarHeight;

  /// Whether to center the title. Defaults to true.
  /// 标题是否居中显示。默认值为 true。
  final bool centerTitle;

  /// The spacing between the title and other elements.
  /// 标题与其他元素之间的间距。
  final double titleSpacing;

  /// The width of the leading widget.
  /// 左侧控件的宽度。
  final double leadingWidth;

  /// The width of the trailing widget (actions).
  /// 右侧控件（操作按钮）的宽度。
  final double actionsWidth;

  /// The background color of the AppBar.
  /// 应用栏的背景颜色。
  final Color? backgroundColor;

  /// The spacing between the title and the bottom widget.
  /// 标题与底部控件之间的间距。
  final double titleBottomSpacing;

  @override
  Widget build(BuildContext context) {
    // Get the screen size and padding from MediaQuery.
    // 从 MediaQuery 获取屏幕大小和边距信息。
    var queryData = MediaQuery.of(context);
    var size = queryData.size;

    return ColoredBox(
      // Set the background color, defaulting to the AppBar theme's color.
      // 设置背景颜色，默认使用主题的 AppBar 颜色。
      color: backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor!,
      child: Column(
        spacing: titleBottomSpacing,
        mainAxisSize: MainAxisSize.min,
        children: [
          IntlRow(
            // Configure the layout for the AppBar's toolbar section.
            // 配置应用栏工具栏部分的布局。
            isLtr: isLtr,
            width: size.width,
            height: toolbarHeight,
            margin: EdgeInsets.only(top: queryData.padding.top),
            spacing: titleSpacing,
            alignment: centerTitle ? Alignment.center : Alignment.centerLeft,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Add the leading widget with size constraints.
              // 添加左侧控件并设置大小约束。
              Container(
                constraints: BoxConstraints(
                  maxWidth: leadingWidth,
                  minWidth: leadingWidth,
                ),
                child: leading ?? SizedBox(),
              ),
              // Add the title widget.
              // 添加标题控件。
              title,
              // Add the action widget with size constraints.
              // 添加右侧操作控件并设置大小约束。
              Container(
                constraints: BoxConstraints(
                  minWidth: actionsWidth,
                  maxWidth: actionsWidth,
                ),
                child: actions,
              ),
            ],
          ),
          // Add the bottom widget, if any.
          // 添加底部控件（如果有）。
          SizedBox(width: size.width, child: bottom),
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    // Calculate the total height of the AppBar, including the toolbar and bottom widget.
    // 计算应用栏的总高度，包括工具栏和底部控件。
    var height = (toolbarHeight) + (bottom?.preferredSize.height ?? 0);
    return Size.fromHeight(height);
  }
}
