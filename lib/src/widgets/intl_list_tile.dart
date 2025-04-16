import 'package:flutter/material.dart';

/// A customizable ListTile widget that supports RTL (Right-to-Left) layouts
/// 一个支持从右到左布局的可自定义列表项组件
class IntlListTile extends StatelessWidget {
  /// Widget displayed at the leading (start) position
  /// 列表项左侧（起始位置）的控件，通常是图标等
  final Widget? leading;

  /// Primary content of the list tile
  /// 列表项的主要标题
  final Widget? title;

  /// Additional content below the title
  /// 列表项的副标题
  final Widget? subtitle;

  /// Widget displayed at the trailing (end) position
  /// 列表项右侧（结束位置）的控件，通常是图标等
  final Widget? trailing;

  /// Whether the list tile is displayed with three lines of text
  /// 是否显示为三行样式，默认为 false
  final bool isThreeLine;

  /// Whether the list tile is part of a dense list
  /// 是否紧凑显示，影响列表项的垂直间距
  final bool? dense;

  /// Defines how compact the list tile's layout will be
  /// 视觉密度，用于调整列表项的布局紧凑程度
  final VisualDensity? visualDensity;

  /// The shape of the list tile's outline
  /// 列表项的形状边界，例如圆角矩形等
  final ShapeBorder? shape;

  /// The list tile's style
  /// 列表项的文本样式
  final ListTileStyle? style;

  /// The color for selected items
  /// 选中状态下的颜色
  final Color? selectedColor;

  /// The color for icons
  /// 图标颜色
  final Color? iconColor;

  /// The color for text
  /// 文本颜色
  final Color? textColor;

  /// Text style for the title
  /// 标题的文本样式
  final TextStyle? titleTextStyle;

  /// Text style for the subtitle
  /// 副标题的文本样式
  final TextStyle? subtitleTextStyle;

  /// Text style for leading and trailing widgets
  /// 左侧和右侧控件中文字的文本样式
  final TextStyle? leadingAndTrailingTextStyle;

  /// The padding around the content
  /// 列表项内容的内边距
  final EdgeInsetsGeometry? contentPadding;

  /// Whether the list tile is interactive
  /// 列表项是否可用，默认为 true
  final bool enabled;

  /// Callback when the list tile is tapped
  /// 点击列表项时的回调函数
  final VoidCallback? onTap;

  /// Callback when the list tile is long-pressed
  /// 长按列表项时的回调函数
  final VoidCallback? onLongPress;

  /// Callback when the focus changes
  /// 焦点变化时的回调函数
  final ValueChanged<bool>? onFocusChange;

  /// The cursor for mouse hover
  /// 鼠标悬停时的光标样式
  final MouseCursor? mouseCursor;

  /// Whether this list tile is selected
  /// 列表项是否处于选中状态，默认为 false
  final bool selected;

  /// The color when the list tile has input focus
  /// 获得焦点时的颜色
  final Color? focusColor;

  /// The color when the mouse hovers over the list tile
  /// 鼠标悬停时的颜色
  final Color? hoverColor;

  /// The color of the splash effect when tapped
  /// 点击时的水波纹颜色
  final Color? splashColor;

  /// An optional focus node to control focus behavior
  /// 焦点节点，用于控制焦点相关的行为
  final FocusNode? focusNode;

  /// Whether to automatically request focus
  /// 是否自动获取焦点，默认为 false
  final bool autofocus;

  /// The background color of the list tile
  /// 列表项的背景颜色
  final Color? tileColor;

  /// The background color when selected
  /// 选中状态下列表项的背景颜色
  final Color? selectedTileColor;

  /// Whether to enable feedback effects
  /// 是否启用反馈，例如点击时的震动反馈
  final bool? enableFeedback;

  /// The horizontal gap between the titles and the leading/trailing widgets
  /// 标题与左侧和右侧控件之间的水平间距
  final double? horizontalTitleGap;

  /// The minimum padding on the top and bottom
  /// 最小垂直内边距
  final double? minVerticalPadding;

  /// The minimum width allocated for the leading widget
  /// 左侧控件的最小宽度
  final double? minLeadingWidth;

  /// The minimum height of the list tile
  /// 列表项的最小高度
  final double? minTileHeight;

  /// The alignment of the title within the list tile
  /// 标题的对齐方式
  final ListTileTitleAlignment? titleAlignment;

  /// Whether to add semantic for tap actions
  /// 是否为点击操作添加语义信息，默认为 true
  final bool internalAddSemanticForOnTap;

  /// Whether the layout direction is left-to-right
  /// 是否为从左到右布局，默认为 true
  final bool isLtr;

  /// Creates an IntlListTile
  /// 创建一个国际化列表项
  const IntlListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.visualDensity,
    this.shape,
    this.style,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.leadingAndTrailingTextStyle,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.mouseCursor,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.focusNode,
    this.autofocus = false,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.minTileHeight,
    this.titleAlignment,
    this.internalAddSemanticForOnTap = true,
    this.isLtr = true,
  });

  @override
  Widget build(BuildContext context) {
    // This builds a custom list tile based on the provided parameters
    // 这里根据传入的参数构建自定义的列表项
    return ListTile(
      leading: isLtr ? leading : trailing,
      title: title,
      subtitle: subtitle,
      trailing: isLtr ? trailing : leading,
      isThreeLine: isThreeLine,
      dense: dense,
      visualDensity: visualDensity,
      shape: shape,
      style: style,
      selectedColor: selectedColor,
      iconColor: iconColor,
      textColor: textColor,
      titleTextStyle: titleTextStyle,
      subtitleTextStyle: subtitleTextStyle,
      leadingAndTrailingTextStyle: leadingAndTrailingTextStyle,
      contentPadding: contentPadding,
      enabled: enabled,
      onTap: onTap,
      onLongPress: onLongPress,
      onFocusChange: onFocusChange,
      mouseCursor: mouseCursor,
      selected: selected,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      focusNode: focusNode,
      autofocus: autofocus,
      tileColor: tileColor,
      selectedTileColor: selectedTileColor,
      enableFeedback: enableFeedback,
      horizontalTitleGap: horizontalTitleGap,
      minVerticalPadding: minVerticalPadding,
      minLeadingWidth: minLeadingWidth,
      minTileHeight: minTileHeight,
      titleAlignment: titleAlignment,
    );
  }
}