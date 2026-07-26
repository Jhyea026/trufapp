import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/custom_divider.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class FormaPagamento {
  final IconData icone;
  final String texto;
  final double largura;

  const FormaPagamento({
    required this.icone,
    required this.texto,
    required this.largura,
  });
}

class ItemResumoPagamento {
  final IconData icone;
  final String texto;
  final String valor;

  const ItemResumoPagamento({
    required this.icone,
    required this.texto,
    required this.valor,
  });
}

class BtsFinalizavenda extends StatelessWidget {
  final List<FormaPagamento> formasPagamento;
  final List<ItemResumoPagamento> itensResumo;
  final String valorTotal;

  const BtsFinalizavenda({
    super.key,
    this.formasPagamento = const [
      FormaPagamento(
        icone: LucideIcons.credit_card,
        texto: 'Cartão de crédito',
        largura: 160,
      ),
      FormaPagamento(
        icone: LucideIcons.banknote,
        texto: 'Dinheiro',
        largura: 105,
      ),
      FormaPagamento(icone: LucideIcons.key_round, texto: 'Pix', largura: 67),
      FormaPagamento(
        icone: LucideIcons.credit_card,
        texto: 'Cartão de débito',
        largura: 155,
      ),
    ],
    this.itensResumo = const [
      ItemResumoPagamento(
        icone: LucideIcons.key_round,
        texto: 'Pix',
        valor: 'R\$ 2,50',
      ),
      ItemResumoPagamento(
        icone: LucideIcons.key_round,
        texto: 'Pix',
        valor: 'R\$ 2,50',
      ),
      ItemResumoPagamento(
        icone: LucideIcons.key_round,
        texto: 'Pix',
        valor: 'R\$ 2,50',
      ),
      ItemResumoPagamento(
        icone: LucideIcons.key_round,
        texto: 'Pix',
        valor: 'R\$ 2,50',
      ),
      ItemResumoPagamento(
        icone: LucideIcons.key_round,
        texto: 'Pix',
        valor: 'R\$ 2,50',
      ),
    ],
    this.valorTotal = 'R\$ 2,50',
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 40,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            AppText(
              text: 'Finalizar venda',
              color: AppColors.darkMocha240,
              fontSize: 28,
              fontWeight: AppFontsWeight.bold,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Escolha a forma de pagamento',
                  color: AppColors.darkMocha240,
                  fontSize: 18,
                  fontWeight: AppFontsWeight.semiBold,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: formasPagamento
                      .map((forma) => _BotaoFormaPagamento(forma: forma))
                      .toList(),
                ),
              ],
            ),

            const CustomDivider(),

            Center(
              child: AppText(
                text: 'Resumo',
                color: AppColors.darkMocha240,
                fontWeight: AppFontsWeight.semiBold,
                fontSize: 18,
              ),
            ),

            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: itensResumo.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) =>
                    _ItemResumoTile(item: itensResumo[index]),
              ),
            ),

            Center(
              child: Column(
                spacing: 10,
                children: [
                  CustomButton(
                    largura: 339,
                    corFundo: AppColors.darkMocha430,
                    filho: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: 'Finalizar Venda',
                            fontWeight: AppFontsWeight.semiBold,
                            fontSize: 18,
                          ),
                          AppText(
                            text: valorTotal,
                            fontWeight: AppFontsWeight.semiBold,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    largura: 339,
                    filho: AppText(
                      text: 'Cancelar venda',
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
      ),
    );
  }
}

class _BotaoFormaPagamento extends StatelessWidget {
  final FormaPagamento forma;

  const _BotaoFormaPagamento({required this.forma});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      altura: 40,
      largura: forma.largura,
      corBorda: AppColors.darkMocha150,
      filho: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(forma.icone),
            AppText(
              text: forma.texto,
              color: AppColors.darkMocha240,
              fontSize: 14,
              fontWeight: AppFontsWeight.semiBold,
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemResumoTile extends StatelessWidget {
  final ItemResumoPagamento item;

  const _ItemResumoTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      altura: 45,
      largura: 350,
      corBorda: AppColors.darkMocha150,
      filho: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(item.icone),
                const SizedBox(width: 8),
                AppText(
                  text: item.texto,
                  color: AppColors.darkMocha240,
                  fontWeight: AppFontsWeight.semiBold,
                  fontSize: 18,
                ),
              ],
            ),
            AppText(
              text: item.valor,
              color: AppColors.darkMocha240,
              fontWeight: AppFontsWeight.semiBold,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
