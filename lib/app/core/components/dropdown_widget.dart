import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';
import 'package:trufapp/app/utils/text_style.dart';

class DropdownWidget extends StatefulWidget {
  final Function(String?)? onChanged;
  final List<DropdownMenuEntry>? itens;
  final String? valorInicial;
  final String? titulo;
  final double? larguradropdown;

  const DropdownWidget({
    super.key,
    this.titulo,
    this.onChanged,
    this.valorInicial,
    this.itens,
    this.larguradropdown,
    required Function(Color) onSelecionado,
  });

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  late List<DropdownMenuEntry> listItens;

  @override
  void initState() {
    super.initState();
    tratandoLista();
  }

  @override
  void didUpdateWidget(covariant DropdownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Atualiza as opções quando o pai fornecer uma nova lista.
    if (oldWidget.itens != widget.itens) {
      tratandoLista();
    }
  }

  void tratandoLista() {
    listItens = (widget.itens ?? []).map((item) {
      return DropdownMenuEntry(
        value: item.value,
        label: item.label,
        labelWidget: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 24),
          child: AppText(
            text: item.label,
            fontSize: 18,
            color: AppColors.darkMocha420,
            fontWeight: AppFontsWeight.bold,
          ),
        ),
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.titulo != null)
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: AppText(
                text: widget.titulo!,
                color: AppColors.darkMocha240,
                fontSize: 18,
                fontWeight: AppFontsWeight.semiBold,
              ),
            ),

          DropdownMenu(
            hintText: 'Selecione',

            textStyle: textStyle(color: AppColors.darkMocha240, fontSize: 18),

            width: widget.larguradropdown,

            dropdownMenuEntries: listItens,

            // Cadastro:
            // valorInicial = null → mostra "Selecione"
            //
            // Edição:
            // valorInicial = ID da categoria → seleciona a categoria
            initialSelection: widget.valorInicial,

            onSelected: (onValue) {
              widget.onChanged?.call(onValue);

              log('Selected: $onValue');
            },

            trailingIcon: Icon(
              Icons.keyboard_arrow_down,
              size: 24,
              color: AppColors.darkMocha240,
            ),

            selectedTrailingIcon: Icon(
              Icons.keyboard_arrow_down,
              size: 24,
              color: AppColors.darkMocha420,
            ),

            expandedInsets: EdgeInsets.all(0),

            inputDecorationTheme: InputDecorationTheme(
              hintStyle: textStyle(color: AppColors.darkMocha150, fontSize: 18),

              constraints: BoxConstraints(maxWidth: double.infinity),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.darkMocha240),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.darkMocha420, width: 2),
              ),
            ),

            menuStyle: MenuStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.lightMocha10),

              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),

              padding: WidgetStatePropertyAll(EdgeInsets.all(22)),
            ),
          ),
        ],
      ),
    );
  }
}
