import 'package:flutter/material.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
  height: 1.5, // espessura da linha
  width: double.infinity,
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.transparent,
        AppColors.darkMocha150,
        Colors.transparent,
      ],
    ),
  ),
);
  }
}