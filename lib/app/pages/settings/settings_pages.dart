import 'package:flutter/material.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_avatar.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/custom_divider.dart';
import 'package:trufapp/app/core/components/custom_text_field.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class SettingsPages extends StatelessWidget {
  const SettingsPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 92),
      child: Column(
        children: [
          SizedBox(height: 12),
          AppText(
            text: "Configurações",
            color: AppColors.darkMocha240,
            fontWeight: AppFontsWeight.bold,
            fontSize: 28,
          ),
          SizedBox(height: 24),
          CustomAvatar(
            size: 100,
            backgroundColor: AppColors.darkMocha460,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: AppText(
                text: "JH",
                color: AppColors.lightMocha10,
                fontWeight: AppFontsWeight.semiBold,
                fontSize: 100,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(24),
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'Nome',
                  controller: TextEditingController(),
                  borderColor: AppColors.darkMocha240,
                ),
                SizedBox(height: 24),
                CustomTextField(
                  hintText: 'Email',
                  controller: TextEditingController(),
                  borderColor: AppColors.darkMocha240,
                ),
                SizedBox(height: 36),
                CustomButton(
                  texto: "Salvar",
                  largura: 250,
                  altura: 47,
                  corFundo: AppColors.darkMocha420,
                  corHover: AppColors.darkMocha430,
                  corTexto: AppColors.lightMocha10,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 32),
                  child: CustomDivider(),
                ),
                CustomButton(
                  texto: "Alterar senha",
                  altura: 47,
                  corFundo: AppColors.darkMocha420,
                  corHover: AppColors.darkMocha430,
                  corTexto: AppColors.lightMocha10,
                ),
                SizedBox(height: 24),
                CustomButton(
                  texto: "Sair",
                  altura: 47,
                  corFundo: AppColors.darkMocha420,
                  corHover: AppColors.darkMocha430,
                  corTexto: AppColors.lightMocha10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 32),
                  child: CustomDivider(),
                ),
                CustomButton(
                  texto: "Gerenciar modo Rua",
                  altura: 47,
                  mostraBorda: true,
                  // corFundo: AppColors.darkMocha420,
                  corHover: AppColors.darkMocha430,
                  // corTexto: AppColors.lightMocha10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
