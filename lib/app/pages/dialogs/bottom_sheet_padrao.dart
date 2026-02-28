import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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
            decoration: BoxDecoration(color: Colors.transparent),
          ),
        ),
        Container(
          width: Get.width,
          height: Get.height * 0.7,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.darkMocha130,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: Get.width * 0.2,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.darkMocha140,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                ),
              ),
              SizedBox(height: 12),
              filho,
            ],
          ),
        ),
      ],
    );
  }
}
