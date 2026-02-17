// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/custom_divider.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class SelectBoxPage extends StatelessWidget {
  const SelectBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: AppColors.lightMocha10,
        child: Padding(
          padding: EdgeInsets.only(left: 21, right: 21),
          child: Column(
            children: [
              Image.asset(
                'assets/images/TrufApp_logo.png',
                width: 258,
                height: 258,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: AppText(
                  text: 'Existe mais de um modo \n Qual deseja escolher?',
                  color: AppColors.darkMocha430,
                  fontWeight: AppFontsWeight.bold,
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400),
                child: Column(
                  spacing: 24,
                  children: [
                    Column(
                      spacing: 12,
                      children: [
                        CustomButton(
                          texto: 'Casa',
                          altura: 92,
                          corTexto: AppColors.lightMocha10,
                          corFundo: AppColors.darkMocha420,
                          corHover: AppColors.darkMocha410,
                          mostraBorda: false,
                          acao: () {
                            Get.offNamed(Routes.navigationMain);
                          },
                        ),
                        CustomButton(
                          texto: 'Rua',
                          altura: 92,
                          corTexto: AppColors.lightMocha10,
                          corFundo: AppColors.darkMocha420,
                          corHover: AppColors.darkMocha410,
                          mostraBorda: false,
                          acao: () {
                            Get.offNamed(Routes.navigationMain);
                          },
                        ),
                      ],
                    ),
                    CustomDivider(),
                    CustomButton(
                      texto: 'Sair da Conta',
                      acao: () {
                        Get.offNamed(Routes.login);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
