import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class DashboardCard extends StatelessWidget {
  final String? texto, quantidade;
  final bool cardClaro;

  const DashboardCard({
    super.key,
    this.texto,
    this.quantidade,
    this.cardClaro = false,
  });

  @override
  Widget build(BuildContext context) {
   
    return Container(
      width: 180,
      height: 150,
      decoration: BoxDecoration(
        color: cardClaro ? AppColors.lightMocha30 : AppColors.darkMocha460,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: cardClaro ? AppColors.darkMocha460 : Colors.transparent ,
        )
      ),
      child: Padding(
        padding: const EdgeInsetsGeometry.fromLTRB(17, 12, 17, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: texto ?? '',
              color: cardClaro ? AppColors.darkMocha460 : AppColors.lightMocha10,
              fontSize: 18,
              fontWeight: AppFontsWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(LucideIcons.box, color: cardClaro ? AppColors.darkMocha460 : AppColors.lightMocha10, size: 24),
                AppText(
                  text: quantidade ?? '' ,
                  color: cardClaro ? AppColors.darkMocha460 : AppColors.lightMocha10,
                  fontSize: 44,
                  fontWeight: AppFontsWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
