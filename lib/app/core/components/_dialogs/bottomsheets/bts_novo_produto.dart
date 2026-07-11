import 'package:flutter/material.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/custom_text_field.dart';
import 'package:trufapp/app/core/components/dropdown_widget.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class BtsNovoProduto extends StatelessWidget {
  const BtsNovoProduto({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
      child: Column(
        children: [
          AppText(
            text: 'Novo produto',
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
                text: 'Nome do produto',
                color: AppColors.darkMocha240,
                fontSize: 18,
                fontWeight: AppFontsWeight.semiBold,
                textAlign: TextAlign.start,
              ),
              CustomTextField(
                hintText: 'Trufa de chocolate...',
                controller: TextEditingController(),
                borderColor: AppColors.darkMocha240,
                colorHint: AppColors.darkMocha150,
                focusBorderColor: AppColors.darkMocha420,
                cursorColor: AppColors.darkMocha410,
                textColor: AppColors.darkMocha420,
              ),
              AppText(
                text: 'Sabor',
                color: AppColors.darkMocha240,
                fontSize: 18,
                fontWeight: AppFontsWeight.semiBold,
                textAlign: TextAlign.start,
              ),
              CustomTextField(
                hintText: 'Chocolate...',
                controller: TextEditingController(),
                borderColor: AppColors.darkMocha240,
                colorHint: AppColors.darkMocha150,
                focusBorderColor: AppColors.darkMocha420,
                cursorColor: AppColors.darkMocha410,
                textColor: AppColors.darkMocha240,
              ),
              DropdownWidget(
                titulo: "Categoria",
                itens: [
                  DropdownMenuEntry(value: 'op1', label: 'Opção 1'),
                  DropdownMenuEntry(value: 'op2', label: 'Opção 2'),
                  DropdownMenuEntry(value: 'op3', label: 'Opção 3'),
                ],
              ),
              Wrap(
                spacing: 12, // espaço horizontal entre os itens
                runSpacing: 8,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Peso',
                        color: AppColors.darkMocha240,
                        fontSize: 18,
                        fontWeight: AppFontsWeight.semiBold,
                        textAlign: TextAlign.start,
                      ),
                      CustomTextField(
                        width: 100,
                        hintText: '0',
                        controller: TextEditingController(),
                        borderColor: AppColors.darkMocha240,
                        colorHint: AppColors.darkMocha150,
                        focusBorderColor: AppColors.darkMocha420,
                        cursorColor: AppColors.darkMocha410,
                        textColor: AppColors.darkMocha240,
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Estoque',
                        color: AppColors.darkMocha240,
                        fontSize: 18,
                        fontWeight: AppFontsWeight.semiBold,
                        textAlign: TextAlign.start,
                      ),
                      CustomTextField(
                        width: 100,
                        hintText: '0',
                        controller: TextEditingController(),
                        borderColor: AppColors.darkMocha240,
                        colorHint: AppColors.darkMocha150,
                        focusBorderColor: AppColors.darkMocha420,
                        cursorColor: AppColors.darkMocha410,
                        textColor: AppColors.darkMocha240,
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Pontos retirada',
                        color: AppColors.darkMocha240,
                        fontSize: 18,
                        fontWeight: AppFontsWeight.semiBold,
                        textAlign: TextAlign.start,
                      ),
                      CustomTextField(
                        width: 144,
                        hintText: '0',
                        controller: TextEditingController(),
                        borderColor: AppColors.darkMocha240,
                        colorHint: AppColors.darkMocha150,
                        focusBorderColor: AppColors.darkMocha420,
                        cursorColor: AppColors.darkMocha410,
                        textColor: AppColors.darkMocha240,
                      ),
                    ],
                  ),
                ],
              ),
              AppText(
                text: 'Preço',
                color: AppColors.darkMocha240,
                fontSize: 18,
                fontWeight: AppFontsWeight.semiBold,
                textAlign: TextAlign.start,
              ),
              CustomTextField(
                prefixBuilder: (hasFocus) => AppText(
                  text: 'R\$',
                  color: hasFocus
                      ? AppColors.darkMocha420
                      : AppColors.darkMocha240,
                  fontSize: 21,
                  fontWeight: AppFontsWeight.semiBold,
                ),
                hintText: '0,00',
                controller: TextEditingController(),
                borderColor: AppColors.darkMocha240,
                colorHint: AppColors.darkMocha150,
                focusBorderColor: AppColors.darkMocha420,
                cursorColor: AppColors.darkMocha410,
                textColor: AppColors.darkMocha240,
              ),
              SizedBox(height: 24),
              CustomButton(
                texto: "Salvar",
                altura: 47,
                corFundo: AppColors.darkMocha420,
                corHover: AppColors.darkMocha430,
                corTexto: AppColors.lightMocha10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
