import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/contador_quantidade.dart';
import 'package:trufapp/app/core/components/etiqueta.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double alturaBotao = 49;
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 86),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 46),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'Casa',
                      color: AppColors.darkMocha240,
                      fontSize: 28,
                      fontWeight: AppFontsWeight.bold,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        LucideIcons.trash,
                        color: AppColors.secondary500,
                        size: 32,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
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
                                      ),
                                      const SizedBox(height: 2),
                                      Etiqueta(
                                        texto: index % 2 == 0
                                            ? "Trufas"
                                            : "Chocolates",
                                      ),
                                      const SizedBox(height: 2),
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
            child: InkWell(
              onTap: () {},
              child: Container(
                height: alturaBotao,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.darkMocha420,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'Crair venda',
                      color: AppColors.lightMocha10,
                      fontSize: 18,
                    ),
                    AppText(
                      text: 'R\$ 10,00',
                      color: AppColors.lightMocha10,
                      fontSize: 18,
                      fontWeight: AppFontsWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
