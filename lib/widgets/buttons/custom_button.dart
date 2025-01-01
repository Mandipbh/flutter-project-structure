import 'package:flutter/material.dart';
import 'package:flutter_project_structure/theme/colors/colors.dart';
import 'package:flutter_project_structure/theme/dimesions/dimensions.dart';

import '../../theme/fonts/font_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double? width;
  final double? height;
    final String fontFamily;


  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.backgroundColor = AppColors.background,
    this.textColor = AppColors.primary,
    this.borderRadius = 12.0,
    this.width,
        this.fontFamily = FontStyles.robotoBold,

    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: width ?? Dimensions.buttonWidth,
        minHeight: height ?? Dimensions.buttonHeight,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.paddingMedium,
            horizontal: Dimensions.paddingLarge,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor, size: Dimensions.fontMedium),
              SizedBox(width: Dimensions.paddingSmall),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: Dimensions.fontMedium,
                fontFamily: fontFamily,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
