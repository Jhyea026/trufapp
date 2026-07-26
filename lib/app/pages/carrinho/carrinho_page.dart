import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_bottom_sheet.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_modal.dart';
import 'package:trufapp/app/core/components/_dialogs/bottomsheets/bts_selecionar_cliente.dart';
import 'package:trufapp/app/core/components/addButtom.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/contador_quantidade.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/etiqueta.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 12,
        bottom: Get.width < 600 ? 80 : 12,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'Carrinho',
                      color: AppColors.darkMocha240,
                      fontSize: 28,
                      fontWeight: AppFontsWeight.bold,
                    ),
                    Addbuttom(acao: () {}),
                  ],
                ),
                SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 52),
                    child: Column(
                      children: [
                        ...List.generate(
                          10,
                          (index) => Container(
                            margin: EdgeInsets.only(bottom: 12),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.lightMocha30,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.darkMocha450),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.darkMocha460,
                                  child: AppText(text: (index + 1).toString()),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: "Produto ${index + 1}",
                                        color: AppColors.darkMocha240,
                                        fontSize: 18,
                                        fontWeight: AppFontsWeight.semiBold,
                                      ),
                                      Etiqueta(
                                        texto: index % 2 == 0
                                            ? "Trufa"
                                            : "Chocolate",
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            text: "R\$ ${index + 1},00",
                                            color: AppColors.darkMocha240,
                                            fontWeight: AppFontsWeight.semiBold,
                                            fontSize: 23,
                                          ),
                                          ContadorQuantidade(
                                            quantidade: index.toString(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CustomButton(
                acao: () {
                  if (Get.width > 600) {
                    Get.dialog(CardModal(filho: BtsSelecionarCliente()));
                  } else {
                    Get.bottomSheet(
                      CardBottomSheet(filho: BtsSelecionarCliente()),
                      isScrollControlled: true,
                    );
                  }
                },
                corHover: AppColors.darkMocha410,
                corFundo: AppColors.darkMocha420,
                mostraBorda: false,
                mostraSombra: true,
                filho: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text: 'Criar venda', fontSize: 18),
                      AppText(
                        text: 'R\$ 10,00',
                        fontWeight: AppFontsWeight.bold,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
