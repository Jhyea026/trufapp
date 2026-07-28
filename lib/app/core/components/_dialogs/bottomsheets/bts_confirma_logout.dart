import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';
import 'package:trufapp/app/services/auth_controller.dart';

class BtsConfirmaLogout extends StatelessWidget {
  const BtsConfirmaLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
      child: Column(
        spacing: 20,
        children: [
          AppText(
            text: 'Sair',
            color: AppColors.darkMocha240,
            fontSize: 28,
            fontWeight: AppFontsWeight.bold,
          ),
          AppText(
            text: 'Você realmente deseja sair?',
            color: AppColors.darkMocha240,
            fontSize: 18,
            fontWeight: AppFontsWeight.regular,
          ),
          Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(acao: () {}, largura: 185, texto: 'Cancelar'),
              CustomButton(
                acao: () async {
                  await Get.find<AuthController>().logout();
                },
                largura: 185,
                corFundo: AppColors.darkMocha410,
                corTexto: AppColors.lightMocha10,
                corHover: AppColors.darkMocha420,
                texto: 'Sair',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
