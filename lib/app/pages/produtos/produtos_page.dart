// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_bottom_sheet.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_modal.dart';
import 'package:trufapp/app/core/components/_dialogs/bottomsheets/novo_produto/bts_novo_produto.dart';
import 'package:trufapp/app/core/components/addButtom.dart';
import 'package:trufapp/app/core/components/appCard.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/custom_text_field.dart';
import 'package:trufapp/app/core/components/etiqueta.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';
import 'package:trufapp/app/pages/produtos/produtos_controller.dart';

class ProdutosPage extends StatelessWidget {
  const ProdutosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProdutosController>(
      init: ProdutosController(),
      builder: (controller) {
        return Container(
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
            top: 12,
            bottom: Get.width < 600 ? 80 : 12,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: 'Produtos',
                        color: AppColors.darkMocha240,
                        fontSize: 28,
                        fontWeight: AppFontsWeight.bold,
                      ),
                      Addbuttom(
                        acao: () {
                          if (Get.width > 600) {
                            Get.dialog(CardModal(filho: BtsNovoProduto()));
                          } else {
                            Get.bottomSheet(
                              CardBottomSheet(filho: BtsNovoProduto()),
                              isScrollControlled: true,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: 'Buscar',
                          controller: controller.buscaController,
                          textColor: AppColors.darkMocha410,
                          borderColor: AppColors.darkMocha180,
                          focusBorderColor: AppColors.darkMocha410,
                          colorHint: AppColors.darkMocha150,
                          cursorColor: AppColors.darkMocha410,
                          borderRadius: BorderRadius.circular(20),
                          onChanged: () => controller.buscar(
                            controller.buscaController.text,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CustomButton(
                          acao: () {},
                          largura: 32,
                          filho: const Icon(LucideIcons.funnel, size: 32),
                          mostraBorda: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Obx(() {
                  if (controller.carregando.value &&
                      controller.produtos.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.produtos.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            LucideIcons.package_open,
                            size: 48,
                            color: AppColors.darkMocha150,
                          ),
                          const SizedBox(height: 12),
                          AppText(
                            text: 'Nenhum produto encontrado',
                            color: AppColors.darkMocha150,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: controller.carregarProdutos,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: controller.produtos.map((produto) {
                          return Appcard(
                            onTap: () {
                              if (Get.width > 600) {
                                Get.dialog(
                                  CardModal(
                                    filho: BtsNovoProduto(
                                      editaProduto: true,
                                      idProdutoEdicao: produto.id,
                                    ),
                                  ),
                                );
                              } else {
                                Get.bottomSheet(
                                  CardBottomSheet(
                                    filho: BtsNovoProduto(
                                      editaProduto: true,
                                      idProdutoEdicao: produto.id,
                                    ),
                                  ),
                                  isScrollControlled: true,
                                );
                              }
                            },
                            filho: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                    color: produto.imagemUrl == null
                                        ? AppColors.darkMocha450
                                        : null,
                                    borderRadius: BorderRadius.circular(10),
                                    image: produto.imagemUrl != null
                                        ? DecorationImage(
                                            image: NetworkImage(
                                              produto.imagemUrl!,
                                            ),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: produto.nome,
                                        color: AppColors.darkMocha240,
                                        fontSize: 18,
                                        fontWeight: AppFontsWeight.semiBold,
                                      ),
                                      if (produto.categoriaNome != null)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 2,
                                            bottom: 5,
                                          ),
                                          child: Etiqueta(
                                            texto: produto.categoriaNome!,
                                          ),
                                        ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            text: 'Estoque: —',
                                            fontSize: 18,
                                            color: AppColors.darkMocha240,
                                          ),
                                          AppText(
                                            text:
                                                'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                                            fontSize: 18,
                                            color: AppColors.darkMocha240,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
