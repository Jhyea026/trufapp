import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/models/itens_menu_model.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';
import 'package:trufapp/app/pages/dashboard/dashboard_home.dart';

class NavigationController extends GetxController {
  RxBool carregando = false.obs;
  RxInt abaSelecionada = 0.obs;
  RxList<ItensMenuModel> itensMenu = [
    ItensMenuModel(
      chave: "home",
      icone: LucideIcons.house,
      tela: Center(
        child: DashboardHome(),
      ),
    ),
    ItensMenuModel(
      chave: "vendas",
      icone: LucideIcons.badge_dollar_sign,
      tela: const Center(
        child: AppText(text: "Vendas", color: Colors.black),
      ),
    ),
    ItensMenuModel(
      chave: "relatorios",
      icone: LucideIcons.chart_no_axes_combined,
      tela: const Center(
        child: AppText(text: "Relatorios", color: Colors.black)
        ),
    ),
    ItensMenuModel(
      chave: "caixa",
      icone: LucideIcons.box,
      tela: const Center(
        child: AppText(text: "Caixa", color: Colors.black),
      ),
    ),
    ItensMenuModel(
      chave: "configuracoes",
      icone: LucideIcons.settings,
      tela: const Center(
        child: AppText(text: "Configurações", color: Colors.black),
      ),
    ),
  ].obs;

  void mudarAbas(int index) {
    abaSelecionada.value = index;
    update();
  }

  void sair() {
    Get.offAllNamed(Routes.initial);
  }
}
