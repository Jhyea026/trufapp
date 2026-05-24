import 'package:flutter/material.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class Appcard extends StatelessWidget {
  final Widget filho;
  final double? altura;
  final EdgeInsetsGeometry? padding;

  const Appcard({super.key, required this.filho, this.altura, this.padding,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.lightMocha30,
        border: BoxBorder.all(
          color: AppColors.darkMocha450
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      width: 500,
      height: altura ?? 98,
      child: filho,
    );
  }
}