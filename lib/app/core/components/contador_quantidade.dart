import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class ContadorQuantidade extends StatelessWidget {
  final String quantidade;
  final VoidCallback? aumentar, diminuir;
  const ContadorQuantidade({
    super.key,
    required this.quantidade,
    this.aumentar,
    this.diminuir,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkMocha220),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: diminuir,
            child: SizedBox(child: Icon(size: 16, LucideIcons.minus)),
          ),
          AppText(
            text: quantidade,
            color: AppColors.darkMocha240,
            fontSize: 14,
          ),
          InkWell(
            onTap: aumentar,
            child: SizedBox(child: Icon(size: 16, LucideIcons.plus)),
          ),
        ],
      ),
    );
  }
}
