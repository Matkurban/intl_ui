import 'package:flutter/material.dart';
import 'package:intl_ui/src/utils/intl_language_util.dart';

class IntlText extends StatelessWidget {
  const IntlText(
    this.data, {
    super.key,
    this.style,
    this.textDirection,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.locale,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
  });

  final String data;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      textDirection: textDirection ?? IntlLanguageUtil.getTextDirection(data),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      locale: locale,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}
