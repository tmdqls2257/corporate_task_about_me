import 'package:flutter/material.dart';

import 'custom_color.dart';

enum TypoType {
  h1Title,
  h1Bold,
  h1,
  h2Bold,
  h2,
  body,
  bodyLight,
  bodyBolder,
  label,
  boldLabel
}

class TypoStyle {
  final FontWeight fontWeight;
  final double fontSize;
  final double letterSpacing;
  final double height;
  String? fontFamily;
  TypoStyle({
    required this.fontWeight,
    required this.fontSize,
    required this.letterSpacing,
    required this.height,
    this.fontFamily,
  });
}

final typoStyle = {
  // TypoType.h1Title:
  //     TypoStyle(fontWeight: FontWeight.w900, fontSize: 32, letterSpacing: 0.48),
  // TypoType.h1Bold:
  //     TypoStyle(fontWeight: FontWeight.w800, fontSize: 24, letterSpacing: 0.48),
  // TypoType.h1:
  //     TypoStyle(fontWeight: FontWeight.w700, fontSize: 24, letterSpacing: 0.48),
  // TypoType.h2Bold:
  //     TypoStyle(fontWeight: FontWeight.w700, fontSize: 18, letterSpacing: 0.32),
  // TypoType.h2:
  //     TypoStyle(fontWeight: FontWeight.w400, fontSize: 18, letterSpacing: 0.32),
  // TypoType.body:
  //     TypoStyle(fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.28),
  // TypoType.bodyLight:
  //     TypoStyle(fontWeight: FontWeight.w300, fontSize: 16, letterSpacing: 0.28),
  // TypoType.bodySmaller:
  //     TypoStyle(fontWeight: FontWeight.w300, fontSize: 14, letterSpacing: 0.28),
  // TypoType.label:
  //     TypoStyle(fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 0.16),
  // TypoType.boldLabel:
  //     TypoStyle(fontWeight: FontWeight.w700, fontSize: 14, letterSpacing: 0.16),
  TypoType.h1: TypoStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      letterSpacing: 0.28,
      height: 1.5,
      fontFamily: 'Gmarket Sans'),
  TypoType.bodyBolder: TypoStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      letterSpacing: 0.28,
      height: 1.3),
  TypoType.body: TypoStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0.28,
      height: 1.7),
  TypoType.bodyLight: TypoStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0.28,
      height: 1.2),
};

class CustomText extends SizedBox {
  final String text;
  final TypoType typoType;
  final TextAlign textAlign;

  CustomText({
    super.key,
    this.text = '',
    this.textAlign = TextAlign.center,
    this.typoType = TypoType.body,
  }) : super(
          child: Text(
            text,
            textAlign: textAlign,
            style: TextStyle(
              color: customColor[CustomColor.black],
              fontWeight: typoStyle[typoType]!.fontWeight,
              fontSize: typoStyle[typoType]!.fontSize,
              letterSpacing: typoStyle[typoType]!.letterSpacing,
              height: typoStyle[typoType]!.height,
              fontFamily: typoStyle[typoType]?.fontFamily,
            ),
          ),
        );
}
