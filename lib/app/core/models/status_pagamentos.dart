import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:trufapp/app/core/models/status_etiquetas.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class StatusPagamentos {
  static const String cartaoCredito = 'Cartão de Crédito';
  static const String cartaoDebito = 'Cartão de Débito';
  // static const String boleto = 'Boleto';
  static const String dinheiro = 'Dinheiro';
  static const String pix = 'Pix';

  static const pagamentos = {
    0: StatusEtiquetas.pendente,
    1: dinheiro,
    2: cartaoCredito,
    3: cartaoDebito,
    4: pix,
  };

  static String getpagamento(int key) => pagamentos[key] ?? 'Desconhecido';

  static List<String> getPagamentos() => pagamentos.values.toList();

  static final Map<String, Color> _mapaStatus = {
    StatusEtiquetas.pendente: AppColors.accentsOrange,
    cartaoCredito: AppColors.accentsPurple,
    cartaoDebito: AppColors.accentsBlue,
    // boleto: AppColors.darkMocha410,
    dinheiro: AppColors.accentsGreen,
    pix: AppColors.accentsGreen,
  };

  static Color getCorStatusPagamentos(String pagamento) {
    final normalized = removeDiacritics(pagamento.toLowerCase().trim());
    return _mapaStatus[normalized] ?? AppColors.darkMocha180;
  }
}
