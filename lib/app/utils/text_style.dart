import 'package:flutter/material.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

TextStyle textStyle({
  bool inherit = true,
  Color? color,
  Color? backgroundColor,
  double fontSize = 16.0,
  String? fontWeight = AppFontsWeight.regular,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  TextLeadingDistribution? leadingDistribution,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
  String? debugLabel,
  List<String>? fontFamilyFallback,
  String? package,
  TextOverflow? overflow,
}) {
  return TextStyle(
    inherit: inherit,
    color: color,
    backgroundColor: backgroundColor,
    fontSize: fontSize,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    height: height,
    leadingDistribution: leadingDistribution,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    fontFeatures: fontFeatures,
    decoration: decoration,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
    debugLabel: debugLabel,
    fontFamily: 'OpenSans',
    fontWeight: parseFontWeight(fontWeight!),
    fontFamilyFallback: fontFamilyFallback,
    package: package,
    overflow: overflow,
  );
}

FontWeight parseFontWeight(String weight) {
  switch (weight.toLowerCase().trim()) {
    case AppFontsWeight.light:
      return FontWeight.w300;

    case AppFontsWeight.regular:
      return FontWeight.w400;

    case AppFontsWeight.semiBold:
      return FontWeight.w600;

    case AppFontsWeight.bold:
      return FontWeight.w700;

    case AppFontsWeight.extraBold:
      return FontWeight.w800;

    default:
      return FontWeight.w400;
  }
}
