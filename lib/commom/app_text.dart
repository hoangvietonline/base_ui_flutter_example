import 'package:base_ui_flutter_example/commom/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FontFamilyType { gilroy, ubuntu }

extension FontFamilyExtension on FontFamilyType {
  String? name() {
    switch (this) {
      case FontFamilyType.gilroy:
        return "Gilroy";
      case FontFamilyType.ubuntu:
        return "Ubuntu";
    }
  }
}

enum FontWeightType { regular, medium, bold }

extension FontWeightTypeExtension on FontWeightType {
  FontWeight type() {
    switch (this) {
      case FontWeightType.regular:
        return FontWeight.w400;
      case FontWeightType.medium:
        return FontWeight.w500;
      case FontWeightType.bold:
        return FontWeight.w700;
    }
  }
}

class AppText extends StatelessWidget {
  final TextStyle? textStyle;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool scalable;
  final String? configKey;

  const AppText._(this.text,
      {Key? key,
      this.textStyle,
      this.textAlign,
      this.overflow,
      this.maxLines,
      this.configKey,
      this.scalable = true})
      : super(key: key);

  factory AppText.primary(String text,
      {Color? color,
      FontWeightType? fontWeight = FontWeightType.regular,
      bool scalable = true,
      String? configKey,
      TextAlign? textAlign,
      int? maxLines,
      double? fontSize = 15.0,
      FontFamilyType? fontFamily = FontFamilyType.gilroy,
      TextDecoration decoration = TextDecoration.none}) {
    return AppText._(
      text,
      textStyle: TextStyle(
          fontWeight: fontWeight?.type(),
          color: color,
          fontSize: fontSize?.sp,
          fontFamily: fontFamily?.name(),
          decoration: decoration),
      scalable: scalable,
      configKey: configKey,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  factory AppText.bodyMedium(String text,
      {Color? color = AppColors.textLightBlack,
      FontWeightType? fontWeight = FontWeightType.medium,
      bool scalable = true,
      String? configKey,
      TextAlign? textAlign,
      int? maxLines,
      double? fontSize = 16.0,
      FontFamilyType? fontFamily = FontFamilyType.gilroy}) {
    return AppText._(
      text,
      textStyle: TextStyle(
          fontWeight: fontWeight?.type(),
          color: color,
          fontSize: fontSize?.sp,
          fontFamily: fontFamily?.name()),
      scalable: scalable,
      configKey: configKey,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    var _text = text;
    return Text(
      _text,
      style: textStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textScaleFactor: scalable ? null : 1.0,
    );
  }
}
