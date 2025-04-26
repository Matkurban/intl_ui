import 'package:flutter/material.dart';

class JsonViewer extends StatelessWidget {
  final Map<String, dynamic> jsonData;

  /// 卡片周围的边距
  final EdgeInsetsGeometry margin;

  /// 行间距
  final double rowSpacing;

  /// key颜色
  final Color keyColor;

  /// 字符串value颜色
  final Color stringColor;

  /// 数字value颜色
  final Color numberColor;

  /// 布尔value颜色
  final Color boolColor;

  /// 普通value颜色
  final Color valueColor;

  /// 对象左侧边框颜色
  final Color objectBorderColor;

  /// 数组左侧边框颜色
  final Color arrayBorderColor;

  /// 行文字大小
  final double fontSize;

  /// 左侧缩进量
  final double indentWidth;

  /// 行内自定义构建
  final Widget Function(
    BuildContext context,
    String keyName,
    dynamic value,
    JsonType type,
    String path,
    TextStyle keyStyle,
    TextStyle valueStyle,
  )?
  rowBuilder;

  final VoidCallback? onTap;

  final VoidCallback? onDoubleTap;

  final VoidCallback? onLongPress;

  const JsonViewer({
    super.key,
    required this.jsonData,
    this.margin = EdgeInsets.zero,
    this.rowSpacing = 2.0,
    this.keyColor = const Color(0xff1dbaf6),
    this.stringColor = const Color(0xfff3821c),
    this.numberColor = const Color(0xff4bc015),
    this.boolColor = Colors.purple,
    this.valueColor = Colors.black,
    this.objectBorderColor = const Color(0xffff9d00),
    this.arrayBorderColor = const Color(0xff3e57e1),
    this.fontSize = 14,
    this.indentWidth = 10,
    this.rowBuilder,
    this.onLongPress,
    this.onTap,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      elevation: 0,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildJsonView(
            keyName: '',
            value: jsonData,
            path: '',
            context: context,
            level: 0,
          ),
        ),
      ),
    );
  }

  Widget _buildJsonView({
    required String keyName,
    required dynamic value,
    required String path,
    required BuildContext context,
    required int level,
  }) {
    if (value is Map) {
      return _buildJsonObject(
        keyName: keyName,
        jsonObject: value,
        path: path,
        context: context,
        level: level,
      );
    } else if (value is List) {
      return _buildJsonArray(
        keyName: keyName,
        jsonArray: value,
        path: path,
        context: context,
        level: level,
      );
    } else {
      return _buildJsonPrimitive(
        keyName: keyName,
        value: value,
        path: path,
        context: context,
      );
    }
  }

  Widget _buildJsonObject({
    required String keyName,
    required Map jsonObject,
    required String path,
    required BuildContext context,
    required int level,
  }) {
    List<Widget> children = [];

    if (keyName.isNotEmpty) {
      children.add(
        _buildJsonRow(
          context: context,
          keyName: keyName,
          value: '{',
          type: JsonType.objectStart,
          path: path,
        ),
      );
    } else {
      children.add(
        _buildJsonRow(
          context: context,
          keyName: '',
          value: '{',
          type: JsonType.objectStart,
          path: path,
        ),
      );
    }

    jsonObject.forEach((key, value) {
      children.add(
        _buildJsonView(
          keyName: key.toString(),
          value: value,
          path: '$path/$key',
          context: context,
          level: level + 1,
        ),
      );
    });

    children.add(
      _buildJsonRow(
        context: context,
        keyName: '',
        value: '},',
        type: JsonType.objectEnd,
        path: path,
      ),
    );

    return Container(
      margin: EdgeInsets.only(left: indentWidth),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: objectBorderColor, width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            children
                .map(
                  (w) => Padding(
                    padding: EdgeInsets.symmetric(vertical: rowSpacing / 2),
                    child: w,
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _buildJsonArray({
    required String keyName,
    required List jsonArray,
    required String path,
    required BuildContext context,
    required int level,
  }) {
    List<Widget> children = [];

    children.add(
      _buildJsonRow(
        context: context,
        keyName: keyName,
        value: '[${jsonArray.length}]',
        type: JsonType.arrayStart,
        path: path,
      ),
    );

    for (int i = 0; i < jsonArray.length; i++) {
      children.add(
        _buildJsonView(
          keyName: '[$i]',
          value: jsonArray[i],
          path: '$path/$i',
          context: context,
          level: level + 1,
        ),
      );
    }

    children.add(
      _buildJsonRow(
        context: context,
        keyName: '',
        value: '],',
        type: JsonType.arrayEnd,
        path: path,
      ),
    );

    return Container(
      margin: EdgeInsets.only(left: indentWidth),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: arrayBorderColor, width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            children
                .map(
                  (w) => Padding(
                    padding: EdgeInsets.symmetric(vertical: rowSpacing / 2),
                    child: w,
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _buildJsonPrimitive({
    required String keyName,
    required dynamic value,
    required String path,
    required BuildContext context,
  }) {
    return _buildJsonRow(
      context: context,
      keyName: keyName,
      value: value,
      type: JsonType.primitive,
      path: path,
    );
  }

  Widget _buildJsonRow({
    required BuildContext context,
    required String keyName,
    required dynamic value,
    required JsonType type,
    required String path,
  }) {
    final TextStyle keyStyle = TextStyle(color: keyColor, fontSize: fontSize);

    Color vColor = valueColor;
    String displayValue = value.toString();

    if (type == JsonType.primitive) {
      if (value is String) {
        displayValue = '"$value"';
        vColor = stringColor;
      } else if (value is num) {
        vColor = numberColor;
      } else if (value is bool) {
        vColor = boolColor;
      }
    } else if (type == JsonType.arrayStart) {
      displayValue = '[${value.toString()}]';
    }

    final TextStyle valueStyle = TextStyle(color: vColor, fontSize: fontSize);

    if (rowBuilder != null) {
      return rowBuilder!(
        context,
        keyName,
        value,
        type,
        path,
        keyStyle,
        valueStyle,
      );
    }

    List<Widget> children = [];

    if (type != JsonType.objectEnd &&
        type != JsonType.arrayEnd &&
        keyName.isNotEmpty) {
      children.add(Text('"$keyName" : ', style: keyStyle));
    }

    children.add(
      Expanded(child: Text(displayValue, style: valueStyle, softWrap: true)),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

enum JsonType { objectStart, objectEnd, arrayStart, arrayEnd, primitive }
