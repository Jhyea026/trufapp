// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/addButtom.dart';
import 'package:trufapp/app/core/components/appCard.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/custom_text_field.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';
import 'package:trufapp/app/pages/dialogs/bottom_sheet_padrao.dart';
import 'package:trufapp/app/pages/dialogs/modal_padrao.dart';

class ClientesPage extends StatelessWidget {
  const ClientesPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                            text: 'Clientes',
                            color: AppColors.darkMocha240,
                            fontSize: 28,
                            fontWeight: AppFontsWeight.bold,
                          ),
                          Addbuttom(acao: () {}),
                        ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Buscar',
                      controller: TextEditingController(),
                      borderColor: AppColors.darkMocha240,
                      colorHint: AppColors.darkMocha240,
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
                          Get.bottomSheet(
                            BottomSheetPadrao(filho: AppText(text: "text")),
                          );
                        }
                      },
                      largura: 32,
                      filho: Icon(LucideIcons.funnel, size: 32),
                      mostraBorda: false,
                    ),
                  ),
                ],
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
                    (index) => Appcard(filho: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(text: 'Nome', color: AppColors.darkMocha240,fontSize: 12, fontWeight: AppFontsWeight.semiBold,),
                          AppText(text: 'Endereço', color: AppColors.darkMocha240,fontSize: 12, fontWeight: AppFontsWeight.semiBold),
                          AppText(text: '(99) 9 9999-9999', color: AppColors.darkMocha240,fontSize: 12, fontWeight: AppFontsWeight.semiBold),
                        ], 
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(LucideIcons.circle_star, size: 20,),
                              SizedBox(width: 12,),
                              AppText(text: '2', color: AppColors.darkMocha240,fontSize: 12, fontWeight: AppFontsWeight.semiBold),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(LucideIcons.gift, size: 20,),
                              SizedBox(width: 12,),
                              AppText(text: '2', color: AppColors.darkMocha240,fontSize: 12, fontWeight: AppFontsWeight.semiBold),
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}