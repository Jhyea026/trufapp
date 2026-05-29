import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/bottom_sheet_padrao.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/custom_divider.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class BtsFinalizavenda extends StatelessWidget {
  const BtsFinalizavenda({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetPadrao(
      filho: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            AppText(
              text: "Finalizar venda",
              color: AppColors.darkMocha240,
              fontSize: 28,
              fontWeight: AppFontsWeight.bold,
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: "Escolha a forma de pagamento",
                  color: AppColors.darkMocha240,
                  fontSize: 18,
                  fontWeight: AppFontsWeight.semiBold,
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    CustomButton(
                      altura: 40,
                      largura: 160,
                      corBorda: AppColors.darkMocha150,
                      filho: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(LucideIcons.credit_card),
                            AppText(
                              text: 'Cartão de crédito',
                              color: AppColors.darkMocha240,
                              fontSize: 14,
                              fontWeight: AppFontsWeight.semiBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      altura: 40,
                      largura: 105,
                      corBorda: AppColors.darkMocha150,
                      filho: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(LucideIcons.banknote),
                            AppText(
                              text: 'Dinheiro',
                              color: AppColors.darkMocha240,
                              fontSize: 14,
                              fontWeight: AppFontsWeight.semiBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      altura: 40,
                      largura: 67,
                      corBorda: AppColors.darkMocha150,
                      filho: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(LucideIcons.key_round),
                            AppText(
                              text: 'Pix',
                              color: AppColors.darkMocha240,
                              fontSize: 14,
                              fontWeight: AppFontsWeight.semiBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      altura: 40,
                      largura: 155,
                      corBorda: AppColors.darkMocha150,
                      filho: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(LucideIcons.credit_card),
                            AppText(
                              text: 'Cartão de débito',
                              color: AppColors.darkMocha240,
                              fontSize: 14,
                              fontWeight: AppFontsWeight.semiBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomDivider(),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            text: 'Resumo',
                            color: AppColors.darkMocha240,
                            fontWeight: AppFontsWeight.semiBold,
                            fontSize: 18,
                          ),
                          SizedBox(height: 8),
                          CustomButton(
                            altura: 45,
                            largura: 350,
                            corBorda: AppColors.darkMocha150,
                            filho: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(LucideIcons.key_round),
                                      SizedBox(width: 8),
                                      AppText(
                                        text: 'Pix',
                                        color: AppColors.darkMocha240,
                                        fontWeight: AppFontsWeight.semiBold,
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AppText(
                                        text: 'R\$ 2,50',
                                        color: AppColors.darkMocha240,
                                        fontWeight: AppFontsWeight.semiBold,
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          CustomButton(
                            altura: 45,
                            largura: 350,
                            corBorda: AppColors.darkMocha150,
                            filho: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(LucideIcons.key_round),
                                      SizedBox(width: 8),
                                      AppText(
                                        text: 'Pix',
                                        color: AppColors.darkMocha240,
                                        fontWeight: AppFontsWeight.semiBold,
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AppText(
                                        text: 'R\$ 2,50',
                                        color: AppColors.darkMocha240,
                                        fontWeight: AppFontsWeight.semiBold,
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomButton(
                            altura: 45,
                            largura: 350,
                            corBorda: AppColors.darkMocha150,
                            filho: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(LucideIcons.key_round),
                                      SizedBox(width: 8),
                                      AppText(
                                        text: 'Pix',
                                        color: AppColors.darkMocha240,
                                        fontWeight: AppFontsWeight.semiBold,
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AppText(
                                        text: 'R\$ 2,50',
                                        color: AppColors.darkMocha240,
                                        fontWeight: AppFontsWeight.semiBold,
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomButton(
                            altura: 45,
                            largura: 350,
                            corBorda: AppColors.darkMocha150,
                            filho: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(LucideIcons.key_round),
                                      SizedBox(width: 8),
                                      AppText(
                                        text: 'Pix',
                                        color: AppColors.darkMocha240,
                                        fontWeight: AppFontsWeight.semiBold,
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AppText(
                                        text: 'R\$ 2,50',
                                        color: AppColors.darkMocha240,
                                        fontWeight: AppFontsWeight.semiBold,
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomButton(
                            altura: 45,
                            largura: 350,
                            corBorda: AppColors.darkMocha150,
                            filho: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(LucideIcons.key_round),
                                      SizedBox(width: 8),
                                      AppText(
                                        text: 'Pix',
                                        color: AppColors.darkMocha240,
                                        fontWeight: AppFontsWeight.semiBold,
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AppText(
                                        text: 'R\$ 2,50',
                                        color: AppColors.darkMocha240,
                                        fontWeight: AppFontsWeight.semiBold,
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 19),
                          CustomButton(
                            largura: 339,
                            corFundo: AppColors.darkMocha430,
                            filho: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text: 'Finalizar Venda',
                                    fontWeight: AppFontsWeight.semiBold,
                                    fontSize: 18,
                                  ),
                                  Row(
                                    children: [
                                      AppText(
                                        text: 'R\$ 2,50',
                                        fontWeight: AppFontsWeight.semiBold,
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomButton(
                            largura: 339,
                            filho: AppText(
                              text: 'Finalizar venda',
                              color: AppColors.darkMocha430,
                              fontWeight: AppFontsWeight.semiBold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
