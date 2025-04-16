import 'package:flutter/material.dart';

/// A highly customizable card widget that combines Material Card with additional features
/// 一个高度可定制的卡片组件，结合了Material卡片的特性和额外功能
class UniversalCard extends StatelessWidget {
  /// Creates a UniversalCard
  /// 创建一个通用卡片
  const UniversalCard({
    super.key,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation = 1.0,
    this.shape,
    this.borderOnForeground = true,
    this.clipBehavior = Clip.none,
    this.margin = EdgeInsets.zero,
    this.semanticContainer = true,
    this.child,
    this.onPress,
    this.onLongPress,
    this.onDoubleTap,
    this.padding = EdgeInsets.zero,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.border,
    this.borderRadius,
    this.gradient,
    this.splashColor,
    this.highlightColor,
    this.isEnabled = true,
    this.backgroundColor,
  });

  /// The card's background color
  /// 卡片的背景颜色
  final Color? color;

  /// The color of the shadow painted below the card
  /// 卡片下方阴影的颜色
  final Color? shadowColor;

  /// The color used as an overlay on the card's surface
  /// 卡片表面的叠加颜色
  final Color? surfaceTintColor;

  /// The card's elevation
  /// 卡片的阴影高度
  final double? elevation;

  /// The shape of the card
  /// 卡片的形状
  final ShapeBorder? shape;

  /// Whether to paint the border in front of the card's child
  /// 是否在卡片子组件前绘制边框
  final bool borderOnForeground;

  /// The content clipping behavior
  /// 内容裁剪行为
  final Clip? clipBehavior;

  /// The margin around the card
  /// 卡片周围的边距
  final EdgeInsetsGeometry margin;

  /// Whether this widget represents a single semantic container
  /// 是否将此组件表示为单个语义容器
  final bool semanticContainer;

  /// The card's content
  /// 卡片的内容
  final Widget? child;

  /// Called when the card is tapped
  /// 点击卡片时的回调
  final VoidCallback? onPress;

  /// Called when the card is long pressed
  /// 长按卡片时的回调
  final VoidCallback? onLongPress;

  /// Called when the card is double tapped
  /// 双击卡片时的回调
  final VoidCallback? onDoubleTap;

  /// The padding inside the card
  /// 卡片内部的内边距
  final EdgeInsetsGeometry padding;

  /// The card's width
  /// 卡片的宽度
  final double? width;

  /// The card's height
  /// 卡片的高度
  final double? height;

  /// The alignment of the card's content
  /// 卡片内容的对齐方式
  final AlignmentGeometry? alignment;

  /// The card's border
  /// 卡片的边框
  final BoxBorder? border;

  /// The card's border radius
  /// 卡片的圆角半径
  final BorderRadiusGeometry? borderRadius;

  /// The gradient to use for the card's background
  /// 卡片背景的渐变色
  final Gradient? gradient;

  /// The splash color when the card is tapped
  /// 卡片点击时的水波纹颜色
  final Color? splashColor;

  /// The highlight color when the card is pressed
  /// 卡片按下时的高亮颜色
  final Color? highlightColor;

  /// Whether the card is enabled for interaction
  /// 卡片是否启用交互
  final bool isEnabled;

  /// The background color of the card container
  /// 卡片容器的背景颜色
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final CardThemeData cardTheme = CardTheme.of(context);
    // 使用辅助方法获取 BorderRadius
    // Use helper method to get BorderRadius
    BorderRadius? effectiveBorderRadius = _getBorderRadius(borderRadius);

    // 如果没有自定义 borderRadius，尝试从 shape 中获取
    // If no custom borderRadius, try to get it from shape
    if (effectiveBorderRadius == null && shape is RoundedRectangleBorder) {
      effectiveBorderRadius = _getBorderRadius(
        (shape as RoundedRectangleBorder).borderRadius,
      );
    }

    Widget cardContent = Container(
      width: width,
      height: height,
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        border: border,
        borderRadius: effectiveBorderRadius,
        gradient: gradient,
        color: backgroundColor,
      ),
      child: child,
    );

    if (isEnabled &&
        (onPress != null || onLongPress != null || onDoubleTap != null)) {
      cardContent = InkWell(
        onTap: onPress,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        splashColor: splashColor,
        highlightColor: highlightColor,
        borderRadius: effectiveBorderRadius,
        child: cardContent,
      );
    }

    return Card(
      color: color ?? cardTheme.color,
      shadowColor: shadowColor ?? cardTheme.shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation ?? cardTheme.elevation ?? 1.0,
      shape: shape ?? cardTheme.shape,
      borderOnForeground: borderOnForeground,
      clipBehavior: clipBehavior,
      margin: margin,
      semanticContainer: semanticContainer,
      child: cardContent,
    );
  }

  /// Helper method to safely convert BorderRadiusGeometry to BorderRadius
  /// 辅助方法，安全地将 BorderRadiusGeometry 转换为 BorderRadius
  BorderRadius? _getBorderRadius(BorderRadiusGeometry? geometry) {
    if (geometry == null) return null;

    if (geometry is BorderRadius) {
      return geometry;
    }

    // Handle different types of BorderRadius
    // 处理不同类型的 BorderRadius
    if (geometry is BorderRadiusDirectional) {
      return BorderRadius.only(
        topLeft: geometry.topStart,
        topRight: geometry.topEnd,
        bottomLeft: geometry.bottomStart,
        bottomRight: geometry.bottomEnd,
      );
    }

    // Default fallback
    // 默认返回
    return BorderRadius.zero;
  }
}
