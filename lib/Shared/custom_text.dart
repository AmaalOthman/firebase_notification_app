import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:premium_store/Core/UI/color_schema.dart';


class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final Color? color;
  final TextDecoration? textDecoration;
  final ui.TextDirection? textDirection;

  const CustomText(
      {
      required this.text,
      this.fontSize = 14,
      this.textAlign,
      this.textDirection,
      this.fontWeight = FontWeight.w400,
      this.color,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      //??
      //(Navigation.rtlDirection(context) ? TextAlign.right : TextAlign.left),
      style: TextStyle(
        color: color ?? ColorUtils.textColor(context),
        fontSize: fontSize,
        fontWeight: fontWeight,
        //     decoration: textDecoration),
        // textDirection: textDirection ??
        //     (Navigation.rtlDirection(context)
        //         ? ui.TextDirection.rtl
        //         : ui.TextDirection.ltr
      ),
    );
  }
}
