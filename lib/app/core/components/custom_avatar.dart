import 'package:flutter/material.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class CustomAvatar extends StatelessWidget {
  final Widget filho;
  final double raio;
  final Color? corFundo;
  final EdgeInsetsGeometry padding;
  final BoxBorder? bordas;
  final double size;

  const CustomAvatar({
    super.key,
    required this.filho,
    this.raio = 40,
    this.corFundo,
    this.padding = const EdgeInsets.all(12),
    this.bordas,  this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: padding,
      decoration: BoxDecoration(
        color: corFundo ?? AppColors.lightMocha10,
        shape: BoxShape.circle,
        border: bordas,
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: filho,
      ),
    );
  }
}