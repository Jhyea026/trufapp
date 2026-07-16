import 'package:flutter/material.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class Appcard extends StatelessWidget {
  final Widget filho;
  final double? altura;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const Appcard({
    super.key,
    required this.filho,
    this.altura,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(10);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Container(
          padding: padding ?? const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: AppColors.lightMocha30,
            border: Border.all(color: AppColors.darkMocha450),
            borderRadius: radius,
          ),
          width: 500,
          // height: altura ?? 98,
          child: filho,
        ),
      ),
    );
  }
}
