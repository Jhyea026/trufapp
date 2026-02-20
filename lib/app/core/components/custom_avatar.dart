import 'package:flutter/material.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class CustomAvatar extends StatelessWidget {
  final Widget child;
  final double radius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;
  final BoxBorder? border;
  final double size;

  const CustomAvatar({
    super.key,
    required this.child,
    this.radius = 40,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(12),
    this.border,  this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.lightMocha10,
        shape: BoxShape.circle,
        border: border,
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: child,
      ),
    );
  }
}