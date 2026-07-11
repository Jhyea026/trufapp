import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class CardModal extends StatelessWidget {
  final Widget filho;
  final double? altura;
  final double? largura;
  final bool mostrarBotaoFechar;
  const CardModal({
    super.key,
    required this.filho,
    this.altura,
    this.largura,
    this.mostrarBotaoFechar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.lightMocha10,
      insetPadding: EdgeInsets.zero,
      child: Container(
        height: altura ?? Get.height * 0.8,
        width: largura ?? Get.width * 0.6,
        decoration: BoxDecoration(
          color: AppColors.darkMocha130,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            filho,
            if (mostrarBotaoFechar)
              Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Icon(
                      Icons.close,
                      color: AppColors.darkMocha240,
                      size: 32,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
