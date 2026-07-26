import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_bottom_sheet.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_modal.dart';
import 'package:trufapp/app/core/components/_dialogs/bottomsheets/bts_novo_cliente.dart';
import 'package:trufapp/app/core/components/appCard.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class BtsInformacoesCliente extends StatelessWidget {
  final bool? brinde;
  const BtsInformacoesCliente({super.key, this.brinde});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
      child: Column(
        children: [
          Column(
            spacing: 19,
            children: [
              AppText(
                text: 'Informações do cliente',
                color: AppColors.darkMocha240,
                fontSize: 28,
                fontWeight: AppFontsWeight.bold,
              ),

              Appcard(
                filho: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppText(
                          text: 'Cod.: ',
                          color: AppColors.darkMocha240,
                          fontSize: 18,
                          fontWeight: AppFontsWeight.regular,
                        ),
                        AppText(
                          text: '01',
                          color: AppColors.darkMocha240,
                          fontSize: 18,
                          fontWeight: AppFontsWeight.bold,
                        ),
                        SizedBox(width: 12),
                        AppText(
                          text: 'Cliente: ',
                          color: AppColors.darkMocha240,
                          fontSize: 18,
                          fontWeight: AppFontsWeight.regular,
                        ),
                        AppText(
                          text: 'Fulano de Tal',
                          color: AppColors.darkMocha240,
                          fontSize: 18,
                          fontWeight: AppFontsWeight.bold,
                        ),
                      ],
                    ),
                    AppText(
                      text: 'Endereço: Rua do bobo, Nº 0',
                      color: AppColors.darkMocha240,
                      fontSize: 18,
                      fontWeight: AppFontsWeight.regular,
                    ),
                    AppText(
                      text: 'Telefone: (99) 9 9999-9999',
                      color: AppColors.darkMocha240,
                      fontSize: 18,
                      fontWeight: AppFontsWeight.regular,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(LucideIcons.circle_star, size: 20),
                                AppText(
                                  text: ' Pontos',
                                  color: AppColors.darkMocha240,
                                  fontSize: 18,
                                  fontWeight: AppFontsWeight.regular,
                                ),
                              ],
                            ),
                            AppText(
                              text: '9',
                              fontSize: 18,
                              color: AppColors.darkMocha240,
                              fontWeight: AppFontsWeight.bold,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(LucideIcons.gift, size: 20),
                                AppText(
                                  text: ' Brindes',
                                  color: AppColors.darkMocha240,
                                  fontSize: 18,
                                  fontWeight: AppFontsWeight.regular,
                                ),
                              ],
                            ),
                            AppText(
                              text: '1',
                              fontSize: 18,
                              color: AppColors.darkMocha240,
                              fontWeight: AppFontsWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                spacing: 8,
                children: [
                  CustomButton(
                    texto: 'Editar',
                    largura: 193,
                    corFundo: AppColors.darkMocha420,
                    corTexto: AppColors.lightMocha10,
                    corHover: AppColors.darkMocha430,
                    acao: () {
                      if (Get.isBottomSheetOpen ?? false) {
                        Get.back();
                      }
                      if (Get.width > 600) {
                        Get.dialog(
                          CardModal(filho: BtsNovoCliente(editarCliente: true)),
                        );
                      } else {
                        Get.bottomSheet(
                          CardBottomSheet(
                            filho: BtsNovoCliente(editarCliente: true),
                          ),
                          isScrollControlled: true,
                        );
                      }
                    },
                  ),
                  CustomButton(
                    texto: 'Retirar brinde',
                    largura: 193,
                    corFundo: brinde == false || brinde == null
                        ? AppColors.darkMocha140
                        : AppColors.darkMocha420,
                    corTexto: brinde == false || brinde == null
                        ? AppColors.darkMocha180
                        : AppColors.lightMocha10,
                    corBorda: brinde == false || brinde == null
                        ? AppColors.darkMocha140
                        : AppColors.darkMocha420,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
