import 'package:flutter/material.dart';
import 'package:flutter_project_structure/theme/dimesions/dimensions.dart';
import 'package:flutter_project_structure/theme/fonts/font_style.dart';

import '../../theme/colors/colors.dart';


class CustomTextView extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color color;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final double letterSpacing;
  final double lineHeight;

  const CustomTextView({
    Key? key,
    required this.text,
    this.fontSize,
    this.color = AppColors.buttonPrimary,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = FontStyles.robotoBold,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.letterSpacing = 0.0,
    this.lineHeight = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? Dimensions.fontMedium,
        color: color,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        height: lineHeight,
      ),
    );
  }
}
