import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_bottom_sheet.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_modal.dart';
import 'package:trufapp/app/core/components/_dialogs/bottomsheets/bts_informacoes_venda.dart';
import 'package:trufapp/app/core/components/appCard.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/custom_text_field.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class BtsSelecionarCliente extends StatelessWidget {
  final int? quantidadeClientes;

  const BtsSelecionarCliente({super.key, this.quantidadeClientes = 10});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 19,
          children: [
            AppText(
              text: 'Selecione o cliente',
              color: AppColors.darkMocha240,
              fontSize: 28,
              fontWeight: AppFontsWeight.bold,
            ),
            CustomTextField(
              hintText: 'Buscar',
              controller: TextEditingController(),
              borderColor: AppColors.darkMocha180,
              focusBorderColor: AppColors.darkMocha410,
              colorHint: AppColors.darkMocha150,
              cursorColor: AppColors.darkMocha410,
              textColor: AppColors.darkMocha420,
              borderRadius: BorderRadius.circular(20),
            ),

            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: quantidadeClientes,
                itemBuilder: (context, index) => Appcard(
                  onTap: () {
                    // ...
                  },
                  filho: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          AppText(
                            text: 'Nome',
                            color: AppColors.darkMocha240,
                            fontSize: 18,
                            fontWeight: AppFontsWeight.semiBold,
                          ),
                          AppText(
                            text: 'Rua do Bobo, Nº 0',
                            color: AppColors.darkMocha180,
                            fontSize: 16,
                            fontWeight: AppFontsWeight.semiBold,
                          ),
                          AppText(
                            text: '(99) 9 9999-9999',
                            color: AppColors.darkMocha180,
                            fontSize: 16,
                            fontWeight: AppFontsWeight.semiBold,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 33,
                        children: [
                          Row(
                            children: [
                              Icon(LucideIcons.circle_star, size: 20),
                              SizedBox(width: 12),
                              AppText(
                                text: '2',
                                color: AppColors.darkMocha240,
                                fontSize: 18,
                                fontWeight: AppFontsWeight.semiBold,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(LucideIcons.gift, size: 20),
                              SizedBox(width: 12),
                              AppText(
                                text: '2',
                                color: AppColors.darkMocha240,
                                fontSize: 18,
                                fontWeight: AppFontsWeight.semiBold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AppText(
              text: 'Realizar venda?',
              color: AppColors.darkMocha240,
              fontSize: 28,
              fontWeight: AppFontsWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  texto: 'Cancelar',
                  largura: 193,
                  corFundo: AppColors.lightMocha10,
                  corTexto: AppColors.darkMocha420,
                  acao: () {
                    // ...
                  },
                ),
                CustomButton(
                  texto: 'Confirmar',
                  largura: 193,
                  corFundo: AppColors.darkMocha420,
                  corTexto: AppColors.lightMocha10,
                  corBorda: AppColors.darkMocha420,
                  corHover: AppColors.darkMocha430,
                  acao: () {
                    if (Get.isBottomSheetOpen ?? false) {
                      Get.back();
                    }
                    if (Get.width > 600) {
                      Get.dialog(CardModal(filho: BtsInformacoesVenda()));
                    } else {
                      Get.bottomSheet(
                        CardBottomSheet(filho: BtsInformacoesVenda()),
                        isScrollControlled: true,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
