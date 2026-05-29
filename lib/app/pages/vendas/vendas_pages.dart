import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/modal_padrao.dart';
import 'package:trufapp/app/core/components/_dialogs/bottomsheets/bts_finaliza_venda.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/custom_text_field.dart';
import 'package:trufapp/app/core/components/etiqueta.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';
import 'package:trufapp/app/pages/vendas/vendas_controller.dart';
import 'package:trufapp/app/utils/data_time_custom.dart';

class VendasPages extends StatelessWidget {
  const VendasPages({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendasController>(
      init: VendasController(),
      // initState: (_) {},
      builder: (vendasController) {
        return Padding(
          padding: EdgeInsets.only(
            top: 12,
            right: 12,
            left: 12,
            bottom: Get.width < 600 ? 80 : 12,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: "Vendas",
                  color: AppColors.darkMocha240,
                  fontWeight: AppFontsWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Buscar',
                      controller: TextEditingController(),
                      textColor: AppColors.darkMocha410,
                      borderColor: AppColors.darkMocha180,
                      focusBorderColor: AppColors.darkMocha410,
                      colorHint: AppColors.darkMocha150,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CustomButton(
                      acao: () {
                        if (Get.width > 600) {
                          Get.dialog(ModalPadrao(filho: AppText(text: "text")));
                        } else {
                          Get.bottomSheet(BtsFinalizavenda());
                        }
                      },
                      largura: 32,
                      filho: Icon(LucideIcons.funnel, size: 32),
                      mostraBorda: false,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  // padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      ...List.generate(20, (index) {
                        String pagamento = vendasController
                            .listPagamentos[vendasController.getPagamento()];

                        Color corPagamento = vendasController
                            .getcolorPagamentos(pagamento);
                        return Container(
                          margin: EdgeInsets.only(bottom: 12),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.lightMocha30,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.darkMocha450),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: AppText(
                                      text: "Cliente ${index + 1}",
                                      color: AppColors.darkMocha240,
                                      fontSize: 18,
                                      fontWeight: AppFontsWeight.semiBold,
                                    ),
                                  ),
                                  Etiqueta(
                                    corBorda: corPagamento,
                                    texto: pagamento,
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text: "Total: R\$ ${index + 1},00",
                                    color: AppColors.darkMocha240,
                                    fontWeight: AppFontsWeight.semiBold,
                                    fontSize: 18,
                                  ),
                                  AppText(
                                    text: "Quantidade ${index + 1}",
                                    color: AppColors.darkMocha240,
                                    fontWeight: AppFontsWeight.semiBold,
                                    fontSize: 18,
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AppText(
                                    text:
                                        DateUtilsCustom.formatDateTimeDDMMYYYYHHMMa(
                                          // DateTime(2822, 7, 16, 02, 28),
                                          DateTime.now(),
                                        ),
                                    // color: AppColors.dark
                                    color: AppColors.darkMocha180,
                                    fontSize: 12,
                                    fontWeight: AppFontsWeight.semiBold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
