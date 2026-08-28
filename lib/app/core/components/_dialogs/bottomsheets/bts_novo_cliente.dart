import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_bottom_sheet.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_modal.dart';
import 'package:trufapp/app/core/components/_dialogs/bottomsheets/bts_informacoes_cliente.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/custom_text_field.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class BtsNovoCliente extends StatelessWidget {
  final bool? editarCliente;
  const BtsNovoCliente({super.key, this.editarCliente = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
      child: Column(
        children: [
          AppText(
            text: editarCliente == false ? 'Novo cliente' : 'Editar cliente',
            color: AppColors.darkMocha240,
            fontSize: 28,
            fontWeight: AppFontsWeight.bold,
          ),
          SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              AppText(
                text: 'Nome',
                color: AppColors.darkMocha240,
                fontSize: 18,
                fontWeight: AppFontsWeight.semiBold,
                textAlign: TextAlign.start,
              ),
              CustomTextField(
                hintText: 'Fulano de tal...',
                controller: TextEditingController(),
                borderColor: AppColors.darkMocha240,
                colorHint: AppColors.darkMocha150,
                focusBorderColor: AppColors.darkMocha420,
                cursorColor: AppColors.darkMocha410,
                textColor: AppColors.darkMocha420,
              ),
              Row(
                children: [
                  AppText(
                    text: 'Apelido',
                    color: AppColors.darkMocha240,
                    fontSize: 18,
                    fontWeight: AppFontsWeight.semiBold,
                    textAlign: TextAlign.start,
                  ),
                  AppText(
                    text: ' (Opcional)',
                    color: AppColors.darkMocha240,
                    fontSize: 14,
                    fontWeight: AppFontsWeight.regular,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              CustomTextField(
                hintText: 'Fulano de tal...',
                controller: TextEditingController(),
                borderColor: AppColors.darkMocha240,
                colorHint: AppColors.darkMocha150,
                focusBorderColor: AppColors.darkMocha420,
                cursorColor: AppColors.darkMocha410,
                textColor: AppColors.darkMocha420,
              ),
              AppText(
                text: 'Endereço',
                color: AppColors.darkMocha240,
                fontSize: 18,
                fontWeight: AppFontsWeight.semiBold,
                textAlign: TextAlign.start,
              ),
              CustomTextField(
                hintText: 'Rua x, Nº 1232...',
                controller: TextEditingController(),
                borderColor: AppColors.darkMocha240,
                colorHint: AppColors.darkMocha150,
                focusBorderColor: AppColors.darkMocha420,
                cursorColor: AppColors.darkMocha410,
                textColor: AppColors.darkMocha420,
              ),
              AppText(
                text: 'Telefone',
                color: AppColors.darkMocha240,
                fontSize: 18,
                fontWeight: AppFontsWeight.semiBold,
                textAlign: TextAlign.start,
              ),
              CustomTextField(
                hintText: '(99) 9 9999-9999',
                controller: TextEditingController(),
                borderColor: AppColors.darkMocha240,
                colorHint: AppColors.darkMocha150,
                focusBorderColor: AppColors.darkMocha420,
                cursorColor: AppColors.darkMocha410,
                textColor: AppColors.darkMocha420,
              ),
              Row(
                children: [
                  AppText(
                    text: 'Observação',
                    color: AppColors.darkMocha240,
                    fontSize: 18,
                    fontWeight: AppFontsWeight.semiBold,
                    textAlign: TextAlign.start,
                  ),
                  AppText(
                    text: ' (Opcional)',
                    color: AppColors.darkMocha240,
                    fontSize: 14,
                    fontWeight: AppFontsWeight.regular,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              CustomTextField(
                hintText: 'Adicione uma observação...',
                controller: TextEditingController(),
                borderColor: AppColors.darkMocha240,
                colorHint: AppColors.darkMocha150,
                focusBorderColor: AppColors.darkMocha420,
                cursorColor: AppColors.darkMocha410,
                textColor: AppColors.darkMocha420,
              ),
            ],
          ),
          SizedBox(height: 24),
          CustomButton(
            texto: editarCliente == false ? 'Cadastrar cliente' : 'Salvar',
            altura: 47,
            corFundo: AppColors.darkMocha420,
            corHover: AppColors.darkMocha430,
            corTexto: AppColors.lightMocha10,
            acao: () {
              if (Get.isBottomSheetOpen ?? false) {
                Get.back();
              }
              if (Get.width > 600) {
                Get.dialog(CardModal(filho: BtsInformacoesCliente()));
              } else {
                Get.bottomSheet(
                  CardBottomSheet(filho: BtsInformacoesCliente()),
                  isScrollControlled: true,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
