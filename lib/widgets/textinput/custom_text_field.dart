import 'package:flutter/material.dart';
import 'package:flutter_project_structure/theme/colors/colors.dart';
import 'package:flutter_project_structure/theme/dimesions/dimensions.dart';

import '../../theme/fonts/font_style.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final Color? iconColor;
  final bool obscureText;
  final TextInputType keyboardType;
  final double borderRadius;
  final Color borderColor;
  final Color fillColor;
  final bool filled;
      final String fontFamily;


  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.icon,
    this.iconColor = AppColors.primary,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.borderRadius = 12.0,
    this.borderColor = AppColors.customBlue,
    this.fillColor = Colors.white,
    this.filled = true,
            this.fontFamily = FontStyles.robotoRegular,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.paddingSmall,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        
        keyboardType: keyboardType,
        style: TextStyle(fontSize: Dimensions.fontMedium,fontFamily: fontFamily),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: Dimensions.fontSmall),
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: iconColor,
                  size: Dimensions.fontLarge,
                )
              : null,
          filled: filled,
          fillColor: fillColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: Dimensions.paddingMedium,
            horizontal: Dimensions.paddingLarge,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: 2.0),
          ),
        ),
      ),
    );
  }
}
