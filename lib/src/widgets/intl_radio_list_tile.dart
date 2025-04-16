import 'package:flutter/material.dart';

/// A custom list tile widget with integrated radio button functionality.
/// 自定义列表项组件，集成了单选按钮功能。

class IntlRadioListTile<T> extends StatelessWidget {
  /// The primary title of the list tile.
  /// 列表项的主要标题。
  final Widget? title;

  /// The subtitle of the list tile.
  /// 列表项的副标题。
  final Widget? subtitle;

  /// A widget displayed at the trailing end of the list tile, typically an icon.
  /// 列表项右侧的控件，通常是图标等。
  final Widget? trailing;

  /// Whether to display the list tile in a three-line layout. Defaults to false.
  /// 是否显示为三行样式，默认为 false。
  final bool isThreeLine;

  /// Whether to display the list tile in a dense layout, affecting vertical spacing.
  /// 是否紧凑显示，影响列表项的垂直间距。
  final bool? dense;

  /// The visual density of the list tile, which adjusts its compactness.
  /// 视觉密度，用于调整列表项的布局紧凑程度。
  final VisualDensity? visualDensity;

  /// The shape of the list tile's boundary, such as rounded corners.
  /// 列表项的形状边界，例如圆角矩形。
  final ShapeBorder? shape;

  /// The text style for the list tile.
  /// 列表项的文本样式。
  final ListTileStyle? style;

  /// The color used when the list tile is selected.
  /// 选中状态下的颜色。
  final Color? selectedColor;

  /// The color of icons within the list tile.
  /// 图标颜色。
  final Color? iconColor;

  /// The color of text within the list tile.
  /// 文本颜色。
  final Color? textColor;

  /// The text style for the title.
  /// 标题的文本样式。
  final TextStyle? titleTextStyle;

  /// The text style for the subtitle.
  /// 副标题的文本样式。
  final TextStyle? subtitleTextStyle;

  /// The text style for the leading and trailing widgets.
  /// 左侧和右侧控件中文字的文本样式。
  final TextStyle? leadingAndTrailingTextStyle;

  /// The padding inside the list tile.
  /// 列表项内容的内边距。
  final EdgeInsetsGeometry? contentPadding;

  /// Whether the list tile is enabled. Defaults to true.
  /// 列表项是否可用，默认为 true。
  final bool enabled;

  /// Callback when the list tile is tapped.
  /// 点击列表项时的回调函数。
  final VoidCallback? onTap;

  /// Callback when the list tile is long-pressed.
  /// 长按列表项时的回调函数。
  final VoidCallback? onLongPress;

  /// Callback when the focus state changes.
  /// 焦点变化时的回调函数。
  final ValueChanged<bool>? onFocusChange;

  /// The cursor style when the mouse hovers over the list tile.
  /// 鼠标悬停时的光标样式。
  final MouseCursor? mouseCursor;

  /// The color of the list tile when it is focused.
  /// 获得焦点时的颜色。
  final Color? focusColor;

  /// The color of the list tile when the mouse hovers over it.
  /// 鼠标悬停时的颜色。
  final Color? hoverColor;

  /// The color of the ripple effect when the list tile is tapped.
  /// 点击时的水波纹颜色。
  final Color? splashColor;

  /// The focus node associated with the list tile, used for managing focus behavior.
  /// 焦点节点，用于控制焦点相关的行为。
  final FocusNode? focusNode;

  /// Whether the list tile automatically gains focus. Defaults to false.
  /// 是否自动获取焦点，默认为 false。
  final bool autofocus;

  /// The background color of the list tile.
  /// 列表项的背景颜色。
  final Color? tileColor;

  /// The background color of the list tile when it is selected.
  /// 选中状态下列表项的背景颜色。
  final Color? selectedTileColor;

  /// Whether to enable feedback (e.g., haptic feedback) when interacting with the list tile.
  /// 是否启用反馈，例如点击时的震动反馈。
  final bool? enableFeedback;

  /// The horizontal spacing between the title and the leading/trailing widgets.
  /// 标题与左侧和右侧控件之间的水平间距。
  final double? horizontalTitleGap;

  /// The minimum vertical padding for the list tile.
  /// 最小垂直内边距。
  final double? minVerticalPadding;

  /// The minimum width for the leading widget.
  /// 左侧控件的最小宽度。
  final double? minLeadingWidth;

  /// The minimum height for the list tile.
  /// 列表项的最小高度。
  final double? minTileHeight;

  /// The alignment of the title within the list tile.
  /// 标题的对齐方式。
  final ListTileTitleAlignment? titleAlignment;

  /// Whether to add semantic information for tap actions. Defaults to true.
  /// 是否为点击操作添加语义信息，默认为 true。
  final bool internalAddSemanticForOnTap;

  /// Whether the layout is left-to-right (LTR). Defaults to true.
  /// 是否是从左到右布局，默认为 true。
  final bool isLtr;

  /// The value returned when the state changes.
  /// 状态变化时返回的值。
  final T value;

  /// The currently selected value for a group of radio buttons.
  /// 当前为一组单选按钮选择的值。
  /// If [groupValue] == [value], the button is selected.
  /// 如果 [groupValue] == [value]，则表示选中状态。
  final T? groupValue;

  /// Callback when the radio button's state changes.
  /// 单选按钮状态变化时的回调函数。
  final ValueChanged<T?>? onChanged;

  /// Whether the radio button is toggleable.
  /// 单选按钮是否可切换状态。
  final bool toggleable;

  /// The active color for the radio button.
  /// 单选按钮激活状态的颜色。
  final Color? activeColor;

  /// The fill color for the radio button, using a state-aware property.
  /// 单选按钮的填充颜色，支持状态感知属性。
  final WidgetStateProperty<Color?>? fillColor;

  /// The material tap target size for the radio button.
  /// 单选按钮的点击目标尺寸。
  final MaterialTapTargetSize? materialTapTargetSize;

  /// The overlay color for the radio button, using a state-aware property.
  /// 单选按钮的覆盖颜色，支持状态感知属性。
  final WidgetStateProperty<Color?>? overlayColor;

  /// The splash radius for the radio button's ripple effect.
  /// 单选按钮水波纹效果的半径。
  final double? splashRadius;

  /// Whether to use the Cupertino-style checkmark for the radio button.
  /// 是否使用 Cupertino 风格的勾选标记。
  final bool useCupertinoCheckmarkStyle;

  const IntlRadioListTile({
    super.key,
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
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.materialTapTargetSize,
    this.overlayColor,
    this.splashRadius,
    this.useCupertinoCheckmarkStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    // Construct the radio button widget with the provided properties.
    // 使用提供的属性构建单选按钮控件。
    Widget radio = Radio(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      mouseCursor: mouseCursor,
      toggleable: toggleable,
      activeColor: activeColor,
      fillColor: fillColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      overlayColor: overlayColor,
      splashRadius: splashRadius,
      materialTapTargetSize: materialTapTargetSize,
      visualDensity: visualDensity,
      focusNode: focusNode,
      autofocus: autofocus,
    );

    // Build a custom list tile with the radio button and other parameters.
    // 根据单选按钮和其他参数构建自定义列表项。
    return ListTile(
      leading: isLtr ? radio : trailing,
      title: title,
      subtitle: subtitle,
      trailing: isLtr ? trailing : radio,
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
      selected: value == groupValue,
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
