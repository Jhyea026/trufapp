import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class ModalPadrao extends StatefulWidget {
  final Widget filho;
  final bool podeFecharAoTocarFora;
  const ModalPadrao({
    super.key,
    required this.filho,
    this.podeFecharAoTocarFora = true,
  });

  @override
  State<ModalPadrao> createState() => _ModalPadraoState();
}

class _ModalPadraoState extends State<ModalPadrao> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          GestureDetector(
            onTap: widget.podeFecharAoTocarFora ? () => Get.back() : null,
            child: Container(
              width: Get.width,
              height: Get.height,
              color: Colors.transparent,
            ),
          ),
          Center(
            child: Container(
              width: Get.width * 0.6,
              height: Get.height * 0.7,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.darkMocha130,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppText(
                          text: 'Titulo',
                          fontSize: 20,
                          fontWeight: AppFontsWeight.bold,
                          color: AppColors.darkMocha240,
                        ),
                      ),
                      CustomButton(
                        largura: 60,
                        mostraBorda: false,
                        filho: Icon(LucideIcons.x, size: 32),
                        acao: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                  widget.filho,
                  // Expanded(
                  //   child: SingleChildScrollView(
                  //     child: Column(children: [widget.filho]),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
