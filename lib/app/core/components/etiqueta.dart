import 'package:flutter/material.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class Etiqueta extends StatelessWidget {
  final String texto;
  final Color? corBorda;
  const Etiqueta({super.key, required this.texto, this.corBorda});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: corBorda ?? AppColors.darkMocha140),
        borderRadius: BorderRadius.circular(4),
      ),
      child: AppText(
        text: texto,
        color: corBorda ?? AppColors.darkMocha240,
        fontSize: 10,
      ),
    );
  }
}
