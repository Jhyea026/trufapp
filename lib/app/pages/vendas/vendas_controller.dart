import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/models/status_pagamentos.dart';

class VendasController extends GetxController {
  final random = Random();

  final listPagamentos = StatusPagamentos.getPagamentos();

  int getPagamento() {
    return random.nextInt(listPagamentos.length);
  }

  Color getcolorPagamentos(String pagamento) {
    // String pagamentoTemp = removeDiacritics(pagamento.toLowerCase().trim());
    return StatusPagamentos.getCorStatusPagamentos(pagamento);
  }
}
