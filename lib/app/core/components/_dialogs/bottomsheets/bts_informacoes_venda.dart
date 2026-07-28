import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_bottom_sheet.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_modal.dart';
import 'package:trufapp/app/core/components/_dialogs/bottomsheets/bts_finaliza_venda.dart';
import 'package:trufapp/app/core/components/appCard.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/etiqueta.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class BtsInformacoesVenda extends StatelessWidget {
  final int quantidadeItens;

  const BtsInformacoesVenda({super.key, this.quantidadeItens = 10});

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
              text: 'Informações da venda',
              color: AppColors.darkMocha240,
              fontSize: 28,
              fontWeight: AppFontsWeight.bold,
            ),
            Appcard(
              filho: Column(
                spacing: 6,
                children: [
                  Row(
                    children: [
                      AppText(
                        text: 'Vendido por: ',
                        color: AppColors.darkMocha240,
                        fontSize: 18,
                        fontWeight: AppFontsWeight.regular,
                      ),
                      AppText(
                        text: 'Mônica',
                        color: AppColors.darkMocha240,
                        fontSize: 18,
                        fontWeight: AppFontsWeight.bold,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AppText(
                        text: 'Cliente: ',
                        color: AppColors.darkMocha240,
                        fontSize: 18,
                        fontWeight: AppFontsWeight.regular,
                      ),
                      AppText(
                        text: 'João henrique',
                        color: AppColors.darkMocha240,
                        fontSize: 18,
                        fontWeight: AppFontsWeight.bold,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppText(
                            text: 'Qtd.: ',
                            color: AppColors.darkMocha240,
                            fontSize: 18,
                            fontWeight: AppFontsWeight.regular,
                          ),
                          AppText(
                            text: '2',
                            color: AppColors.darkMocha240,
                            fontSize: 18,
                            fontWeight: AppFontsWeight.bold,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AppText(
                            text: 'Valor: R\$ ',
                            color: AppColors.darkMocha240,
                            fontSize: 18,
                            fontWeight: AppFontsWeight.regular,
                          ),
                          AppText(
                            text: '5,00',
                            color: AppColors.darkMocha240,
                            fontSize: 18,
                            fontWeight: AppFontsWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: 'Forma de pagamento',
                        color: AppColors.darkMocha240,
                        fontSize: 18,
                        fontWeight: AppFontsWeight.regular,
                      ),
                      Etiqueta(texto: 'Pix', corBorda: AppColors.accentsGreen),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Data da venda ',
                            color: AppColors.darkMocha240,
                            fontSize: 18,
                            fontWeight: AppFontsWeight.regular,
                          ),
                          AppText(
                            text: '15/07/2026',
                            color: AppColors.darkMocha240,
                            fontSize: 18,
                            fontWeight: AppFontsWeight.bold,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Data do pagamento ',
                            color: AppColors.darkMocha240,
                            fontSize: 18,
                            fontWeight: AppFontsWeight.regular,
                          ),
                          AppText(
                            text: '15/07/2026',
                            color: AppColors.darkMocha240,
                            fontSize: 18,
                            fontWeight: AppFontsWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppText(
              text: 'Itens da venda',
              color: AppColors.darkMocha240,
              fontSize: 23,
              fontWeight: AppFontsWeight.bold,
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: quantidadeItens,
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
            CustomButton(
              altura: 49,
              corHover: AppColors.darkMocha410,
              corFundo: AppColors.darkMocha420,
              filho: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'Pagar',
                      fontSize: 18,
                      fontWeight: AppFontsWeight.semiBold,
                    ),
                    AppText(
                      text: 'R\$ 5,00',

                      fontSize: 18,
                      fontWeight: AppFontsWeight.semiBold,
                    ),
                  ],
                ),
              ),
              acao: () {
                if (Get.isBottomSheetOpen ?? false) {
                  Get.back();
                }
                if (Get.width > 600) {
                  Get.dialog(CardModal(filho: BtsFinalizavenda()));
                } else {
                  Get.bottomSheet(
                    CardBottomSheet(filho: BtsFinalizavenda()),
                    isScrollControlled: true,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
