import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/_dialogs/_defaults/cards/card_modal.dart';

class ModalPadrao extends StatelessWidget {
  final Widget filho;
  final Widget modal;
  final bool podeFecharAoTocarFora;
  final double? larguraModal;
  final double? alturaModal;
  const ModalPadrao({
    super.key,
    required this.filho,
    required this.modal,
    this.larguraModal,
    this.alturaModal,
    this.podeFecharAoTocarFora = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(
          CardModal(filho: modal, altura: alturaModal, largura: larguraModal),
          barrierDismissible: podeFecharAoTocarFora,
        );
      },
      child: filho,
    );
  }
}
