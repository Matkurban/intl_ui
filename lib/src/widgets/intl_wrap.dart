import 'dart:math';
import 'package:flutter/material.dart';

/// A custom Wrap widget with enhanced layout options, including support for reversing children groups for RTL (right-to-left) layouts.
/// 一个自定义的 Wrap 小部件，提供增强的布局选项，包括支持 RTL（从右到左）布局下的子组件分组反转。

class IntlWrap extends StatelessWidget {
  /// The list of child widgets to be displayed in the Wrap.
  /// 要在 Wrap 中显示的子组件列表。
  final List<Widget> children;

  /// How the children should be aligned along the main axis in a single run of the Wrap.
  /// 子组件在 Wrap 的主轴上的对齐方式。
  final WrapAlignment alignment;

  /// How the children should be aligned along the main axis between multiple runs.
  /// 子组件在多行之间的主轴上的对齐方式。
  final WrapAlignment runAlignment;

  /// The horizontal spacing between children.
  /// 子组件之间的水平间距。
  final double spacing;

  /// The vertical spacing between runs of children.
  /// 子组件行之间的垂直间距。
  final double runSpacing;

  /// The number of children to group together for reversing in RTL layouts.
  /// 在 RTL 布局下分组进行反转的子组件数量。
  final int step;

  /// How the children should be aligned along the cross axis.
  /// 子组件在交叉轴上的对齐方式。
  final WrapCrossAlignment crossAxisAlignment;

  /// Whether the layout is left-to-right (LTR). Defaults to true.
  /// 布局是否为从左到右（LTR）。默认为 true。
  final bool isLtr;

  const IntlWrap({
    super.key,
    required this.children,
    this.alignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.runSpacing = 0.0,
    this.runAlignment = WrapAlignment.start,
    this.step = 3,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.isLtr = true,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // Set the horizontal spacing between children.
      // 设置子组件之间的水平间距。
      spacing: spacing,
      // Set the vertical spacing between runs.
      // 设置子组件行之间的垂直间距。
      runSpacing: runSpacing,
      // Set alignment along the main axis.
      // 设置主轴上的对齐方式。
      alignment: alignment,
      // Set alignment along the main axis between multiple runs.
      // 设置多行之间主轴上的对齐方式。
      runAlignment: runAlignment,
      // Set alignment along the cross axis.
      // 设置交叉轴上的对齐方式。
      crossAxisAlignment: crossAxisAlignment,
      // Arrange the children based on the isLtr flag.
      // 根据 isLtr 标志排列子组件。
      children: _arrangeChildren(children),
    );
  }

  /// Arranges the children based on the layout direction (LTR or RTL).
  /// 根据布局方向（LTR 或 RTL）排列子组件。
  List<Widget> _arrangeChildren(List<Widget> children) {
    // If layout is LTR, return the children as-is.
    // 如果布局为 LTR，则直接返回子组件。
    if (isLtr) {
      return children;
    }
    // For RTL, reverse groups of children based on the step size.
    // 对于 RTL，根据步长分组并反转子组件。
    final List<Widget> rtlChildren = [];
    final int numChildren = children.length;
    for (int startIndex = 0; startIndex < numChildren; startIndex += step) {
      // Determine the end index for the current group.
      // 确定当前分组的结束索引。
      final int endIndex = min(startIndex + step, numChildren);
      // Get the group of children for the current step and reverse them.
      // 获取当前步长的子组件分组并反转。
      final List<Widget> group = children.sublist(startIndex, endIndex);
      rtlChildren.addAll(group.reversed);
    }
    // Return the rearranged children for RTL layout.
    // 返回为 RTL 布局重新排列的子组件。
    return rtlChildren;
  }
}
