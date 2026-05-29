// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/bottom_sheet_padrao.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/modal_padrao.dart';
import 'package:trufapp/app/core/components/addButtom.dart';
import 'package:trufapp/app/core/components/appCard.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/custom_text_field.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

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
                        spacing: 10,
                        children: [
                          AppText(text: 'Nome', color: AppColors.darkMocha240,fontSize: 18,fontWeight: AppFontsWeight.semiBold,),
                          AppText(text: 'Rua do Bobo, Nº 0', color: AppColors.darkMocha180,fontSize: 16, fontWeight: AppFontsWeight.semiBold),
                          AppText(text: '(99) 9 9999-9999', color: AppColors.darkMocha180,fontSize: 16, fontWeight: AppFontsWeight.semiBold),
                        ], 
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 33,
                        children: [
                          Row(
                            children: [
                              Icon(LucideIcons.circle_star, size: 20,),
                              SizedBox(width: 12,),
                              AppText(text: '2', color: AppColors.darkMocha240,fontSize: 18, fontWeight: AppFontsWeight.semiBold),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(LucideIcons.gift, size: 20,),
                              SizedBox(width: 12,),
                              AppText(text: '2', color: AppColors.darkMocha240,fontSize: 18, fontWeight: AppFontsWeight.semiBold),
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