import 'package:flutter/material.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';
import 'package:trufapp/app/utils/text_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onChanged;
  final double? width;
  final double? height;
  final Widget? prefix;
  final Color? borderColor;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.width,
    this.height,
    this.prefix,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      height: height ?? 56,
      child: TextField(
        controller: controller,
        onChanged: (value) => onChanged?.call(),
        cursorColor: AppColors.lightMocha10,
        style: textStyle(
          // altera o estilo do texto digitado
          color: AppColors.lightMocha10,
          fontSize: 18,
          fontWeight: AppFontsWeight.light,
        ),
        decoration: InputDecoration(
          hintStyle: textStyle(
            color: AppColors.lightMocha10
          ), // altera o estilo do texto placheorder
          // altera a cor das bordas quando não tá focado
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor ?? AppColors.lightMocha10),
          ),
          focusedBorder: OutlineInputBorder(
            // Altera a cor das bordas quando tá focado
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor ?? AppColors.lightMocha10),
          ),
          // focusColor: Colors.red,
          prefix: prefix,
          // contentPadding: const EdgeInsets.symmetric(
          //   horizontal: 16,
          //   vertical: 18,
          // ),
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: borderColor ?? Colors.red)),
          hintText: hintText,
        ),
      ),
    );
  }
}
