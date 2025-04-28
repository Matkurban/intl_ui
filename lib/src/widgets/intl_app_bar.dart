import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable AppBar widget with support for various configurations.
/// 可配置的自定义应用栏部件，支持多种设置。

class IntlAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The widget displayed on the left side, usually a back arrow or similar.
  /// 左侧显示的控件，通常是返回箭头或类似控件。
  final Widget? leading;

  /// Whether to automatically infer and display the leading widget (e.g., back arrow) based on navigation context.
  /// 是否自动推断并显示左侧控件（如返回箭头），基于导航上下文。
  final bool automaticallyImplyLeading;

  /// The widget displayed in the middle of the AppBar, usually a title.
  /// 应用栏中间显示的控件，通常是标题。
  final Widget? title;

  /// The widgets displayed on the right side of the AppBar, typically action buttons.
  /// 应用栏右侧显示的控件，通常是操作按钮。
  final List<Widget> actions;

  /// A flexible area below the AppBar, often used for parallax effects or similar layouts.
  /// 应用栏下方的灵活区域，通常用于实现视差效果或类似布局。
  final Widget? flexibleSpace;

  /// A widget displayed at the bottom of the AppBar, such as a tab bar.
  /// 应用栏底部显示的自定义控件，例如选项卡。
  final PreferredSizeWidget? bottom;

  /// The height of the AppBar's shadow; higher values produce more pronounced shadows.
  /// 应用栏阴影的高度，值越大阴影越明显。
  final double? elevation;

  /// The height of the shadow when the AppBar is scrolled under.
  /// 当应用栏滚动时下方的阴影高度。
  final double? scrolledUnderElevation;

  /// A callback to determine whether to apply certain scroll-related behaviors based on scroll notifications.
  /// 根据滚动通知决定是否应用某些滚动相关行为的回调函数。
  final ScrollNotificationPredicate notificationPredicate;

  /// The color of the AppBar's shadow.
  /// 应用栏阴影的颜色。
  final Color? shadowColor;

  /// The color of the AppBar's surface tint.
  /// 应用栏表面色调的颜色。
  final Color? surfaceTintColor;

  /// The shape of the AppBar's boundary, such as rounded corners.
  /// 应用栏的边界形状，例如圆角。
  final ShapeBorder? shape;

  /// The background color of the AppBar.
  /// 应用栏的背景颜色。
  final Color? backgroundColor;

  /// The foreground color of the AppBar, such as text and icon colors.
  /// 应用栏的前景颜色，例如文字和图标颜色。
  final Color? foregroundColor;

  /// The theme for icons in the AppBar, including color, size, etc.
  /// 应用栏中图标的主题样式，包括颜色、大小等。
  final IconThemeData? iconTheme;

  /// The theme for the icons in the AppBar's action items.
  /// 应用栏右侧操作按钮中图标的主题样式。
  final IconThemeData? actionsIconTheme;

  /// Whether this AppBar is the primary AppBar, affecting system-level behavior and style.
  /// 是否为主要的应用栏，这会影响系统级别的行为和样式。
  final bool primary;

  /// Whether to center the title in the AppBar. If null, the system default rules are applied.
  /// 是否将标题居中显示，若为null则使用系统默认规则。
  final bool? centerTitle;

  /// Whether to exclude the AppBar's title semantics for accessibility.
  /// 是否排除应用栏标题的语义信息（用于辅助功能）。
  final bool excludeHeaderSemantics;

  /// The spacing between the title and other elements in the AppBar.
  /// 标题与其他元素之间的间距。
  final double? titleSpacing;

  /// The opacity of the toolbar area in the AppBar, ranging from 0.0 (completely transparent) to 1.0 (completely opaque).
  /// 工具栏部分的不透明度，范围为0.0（完全透明）到1.0（完全不透明）。
  final double toolbarOpacity;

  /// The opacity of the bottom area in the AppBar, ranging from 0.0 (completely transparent) to 1.0 (completely opaque).
  /// 底部部分的不透明度，范围为0.0（完全透明）到1.0（完全不透明）。
  final double bottomOpacity;

  /// The height of the toolbar area in the AppBar.
  /// 工具栏部分的高度。
  final double? toolbarHeight;

  /// The width of the leading widget in the AppBar.
  /// 左侧控件的宽度。
  final double? leadingWidth;

  /// The text style for the toolbar's text in the AppBar.
  /// 工具栏文字的样式，包括字体、颜色、大小等。
  final TextStyle? toolbarTextStyle;

  /// The text style for the title's text in the AppBar.
  /// 标题文字的样式，包括字体、颜色、大小等。
  final TextStyle? titleTextStyle;

  /// The system-level overlay style for the AppBar's page, such as status bar color and icon style.
  /// 应用栏所在页面的系统覆盖样式，例如状态栏颜色和图标样式。
  final SystemUiOverlayStyle? systemOverlayStyle;

  /// Whether to force the AppBar to use a transparent material effect.
  /// 是否强制应用栏使用透明材质效果。
  final bool forceMaterialTransparency;

  /// The clipping behavior for the AppBar, such as hard edges or anti-aliased edges.
  /// 应用栏的剪裁行为，例如硬边缘或抗锯齿剪裁。
  final Clip? clipBehavior;

  /// Whether the layout direction is left-to-right (LTR). Defaults to true.
  /// 是否是从左到右布局，默认为true。
  final bool isLtr;

  final double actionWidgetWidth = 48.0;

  final IconData ltrLeadingIcon = Icons.arrow_back;
  final IconData rtlLeadingIcon = Icons.arrow_forward;

  const IntlAppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions = const <Widget>[],
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
    this.isLtr = true,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> actionsList = actions;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    // 计算 actions 的总宽度
    double getActionsWidth() {
      double totalWidth = 0;
      // 默认每个 action 按钮宽度为 48（Material Design 标准）
      totalWidth = actionWidgetWidth * actionsList.length;
      return totalWidth;
    }

    Widget? leadingWidget;
    List<Widget> actionsWidget;
    double? computedLeadingWidth;

    if (isLtr) {
      leadingWidget = leading;
      if (leadingWidget == null && automaticallyImplyLeading) {
        if (parentRoute?.impliesAppBarDismissal ?? false) {
          leadingWidget =
              useCloseButton ? const CloseButton() : const BackButton();
        }
      }
      actionsWidget = actionsList.isNotEmpty ? actionsList : [];
      computedLeadingWidth = leadingWidth;
    } else {
      if (actionsList.isNotEmpty) {
        leadingWidget = Row(
          mainAxisSize: MainAxisSize.min,
          children: actionsList,
        );
      } else {
        leadingWidget = Row();
        computedLeadingWidth = 0;
      }
      actionsWidget = leading != null ? <Widget>[leading!] : [];

      if (leading != null) {
        actionsWidget = <Widget>[leading!];
      } else {
        if (actionsWidget.isEmpty && automaticallyImplyLeading) {
          if (parentRoute?.impliesAppBarDismissal ?? false) {
            actionsWidget = [
              IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: Icon(
                  isLtr ? ltrLeadingIcon : rtlLeadingIcon,
                  color: Theme.of(context).appBarTheme.iconTheme?.color,
                ),
              ),
            ];
          }
        }
      }

      // 当方向为 RTL 时，使用计算后的 actions 宽度
      computedLeadingWidth =
          actionsList.isNotEmpty ? getActionsWidth() : leadingWidth;
    }

    return AppBar(
      leading: leadingWidget,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      actions: actionsWidget,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
      notificationPredicate: notificationPredicate,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      shape: shape,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      primary: primary,
      centerTitle: centerTitle,
      excludeHeaderSemantics: excludeHeaderSemantics,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      toolbarHeight: toolbarHeight,
      leadingWidth: computedLeadingWidth,
      toolbarTextStyle: toolbarTextStyle,
      titleTextStyle: titleTextStyle,
      systemOverlayStyle: systemOverlayStyle,
      forceMaterialTransparency: forceMaterialTransparency,
      clipBehavior: clipBehavior,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    (toolbarHeight ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0),
  );
}

/// Default scroll notification predicate to determine scroll behaviors.
/// 用于判断滚动相关行为的默认滚动通知回调函数。
bool defaultScrollNotificationPredicate(ScrollNotification notification) {
  return notification.depth == 0;
}
