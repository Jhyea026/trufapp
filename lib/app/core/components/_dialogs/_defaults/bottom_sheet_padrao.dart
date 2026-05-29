import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_bottom_sheet.dart';

class BottomSheetPadrao extends StatelessWidget {
  final Widget filho;
  final Widget bottomSheet;

  const BottomSheetPadrao({
    super.key,
    required this.filho,
    required this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Get.bottomSheet(
          CardBottomSheet(filho: bottomSheet),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      },
      child: Padding(padding: const EdgeInsets.all(4), child: filho),
    );
  }
}
