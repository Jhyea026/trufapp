import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class BottomSheetPadrao extends StatelessWidget {
  final Widget filho;

  const BottomSheetPadrao({super.key, required this.filho});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            width: Get.width,
            height: Get.height,
            color: Colors.transparent,
          ),
        ),

        /// Fixa no rodapé
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: Get.width,
            constraints: BoxConstraints(maxHeight: Get.height * 0.9),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.lightMocha10,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: Get.width * 0.3,
                    height: 3,
                    decoration: BoxDecoration(
                      color: AppColors.darkMocha140,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),

                  const SizedBox(height: 12),

                  filho,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
