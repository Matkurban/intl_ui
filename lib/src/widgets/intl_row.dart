import 'package:flutter/material.dart';

/// A customizable Row widget wrapped in a Container with additional properties like padding, margin, alignment, and decorations.
/// 一个可自定义的 Row 小部件，包装在一个具有额外属性（如内边距、外边距、对齐方式和装饰）的 Container 中。

class IntlRow extends StatelessWidget {
  /// Alignment of widgets along the main axis.
  /// 主轴上的对齐方式。
  final MainAxisAlignment mainAxisAlignment;

  /// Size of the row in the main axis (max or min).
  /// 主轴方向的尺寸（最大或最小）。
  final MainAxisSize mainAxisSize;

  /// Alignment of widgets along the cross axis.
  /// 交叉轴上的对齐方式。
  final CrossAxisAlignment crossAxisAlignment;

  /// The text direction (e.g., LTR or RTL).
  /// 文本方向（例如从左到右或从右到左）。
  final TextDirection? textDirection;

  /// The direction of widgets along the vertical axis.
  /// 垂直方向的排列顺序。
  final VerticalDirection verticalDirection;

  /// The baseline used for aligning text.
  /// 对齐文本的基线。
  final TextBaseline? textBaseline;

  /// Spacing between the child widgets.
  /// 子组件之间的间距。
  final double spacing;

  /// The list of child widgets.
  /// 子组件集合。
  final List<Widget> children;

  /// Whether the layout is left-to-right (LTR). Defaults to true.
  /// 布局是否为从左到右（LTR）。默认为 true。
  final bool isLtr;

  /// The width of the container.
  /// 容器的宽度。
  final double? width;

  /// The height of the container.
  /// 容器的高度。
  final double? height;

  /// Alignment of the child widgets within the container.
  /// 子组件在容器内的对齐方式。
  final AlignmentGeometry? alignment;

  /// Padding inside the container.
  /// 容器的内边距。
  final EdgeInsetsGeometry? padding;

  /// The background color of the container.
  /// 容器的背景颜色。
  final Color? backgroundColor;

  /// Decoration for the background of the container.
  /// 容器的背景装饰。
  final Decoration? decoration;

  /// Decoration for the foreground of the container.
  /// 容器的前景装饰。
  final Decoration? foregroundDecoration;

  /// Constraints applied to the container.
  /// 容器的约束。
  final BoxConstraints? constraints;

  /// Margin outside the container.
  /// 容器的外边距。
  final EdgeInsetsGeometry? margin;

  /// Transformation matrix applied before rendering the container.
  /// 在绘制容器之前要应用的转换矩阵。
  final Matrix4? transform;

  /// Alignment of the origin relative to the container size (used with [transform]).
  /// 原点相对于容器大小的对齐方式（用于 [transform]）。
  /// Ignored if [transform] is null.
  /// 如果 [transform] 为 null，则忽略此属性。
  final AlignmentGeometry? transformAlignment;

  /// Clipping behavior of the container (e.g., none, anti-aliasing).
  /// 容器的裁剪行为（例如无裁剪、抗锯齿裁剪等）。
  final Clip clipBehavior;

  const IntlRow({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline, // NO DEFAULT: We don't know what the text baseline should be.
    this.spacing = 0.0,
    this.children = const <Widget>[],
    this.isLtr = true,
    this.width,
    this.height,
    this.alignment,
    this.padding,
    this.backgroundColor,
    this.decoration,
    this.foregroundDecoration,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Set the width of the container.
      // 设置容器的宽度。
      width: width,
      // Set the height of the container.
      // 设置容器的高度。
      height: height,
      // Align the child widgets within the container.
      // 设置子组件在容器内的对齐方式。
      alignment: alignment,
      // Add padding inside the container.
      // 添加容器的内边距。
      padding: padding,
      // Set the background color of the container.
      // 设置容器的背景颜色。
      color: backgroundColor,
      // Apply background decoration to the container.
      // 设置容器的背景装饰。
      decoration: decoration,
      // Apply foreground decoration to the container.
      // 设置容器的前景装饰。
      foregroundDecoration: foregroundDecoration,
      // Apply constraints to the container.
      // 设置容器的约束。
      constraints: constraints,
      // Add margin outside the container.
      // 添加容器的外边距。
      margin: margin,
      // Apply a transformation matrix to the container.
      // 应用转换矩阵到容器。
      transform: transform,
      // Align the transformation origin as per the container size.
      // 根据容器大小对齐转换原点。
      transformAlignment: transformAlignment,
      // Set the clipping behavior for the container.
      // 设置容器的裁剪行为。
      clipBehavior: clipBehavior,
      child: Row(
        // Align widgets along the main axis.
        // 设置主轴上的对齐方式。
        mainAxisAlignment: mainAxisAlignment,
        // Set the size of the row in the main axis.
        // 设置主轴方向的尺寸。
        mainAxisSize: mainAxisSize,
        // Align widgets along the cross axis.
        // 设置交叉轴上的对齐方式。
        crossAxisAlignment: crossAxisAlignment,
        // Set the text direction.
        // 设置文本方向。
        textDirection: textDirection,
        // Set the vertical direction of widgets.
        // 设置垂直方向的排列顺序。
        verticalDirection: verticalDirection,
        // Align widgets based on the text baseline.
        // 根据文本基线对齐子组件。
        textBaseline: textBaseline,
        // Add spacing between child widgets.
        // 设置子组件之间的间距。
        spacing: spacing,
        // Reverse the order of children if not LTR.
        // 如果不是从左到右布局，则反转子组件的顺序。
        children: isLtr ? children : children.reversed.toList(),
      ),
    );
  }
}
