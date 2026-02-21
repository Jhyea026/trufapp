import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/models/itens_menu_model.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/pages/dashboard/dashboard_page.dart';
import 'package:trufapp/app/pages/settings/settings_pages.dart';

class HomeController extends GetxController {
  RxBool carregando = false.obs;
  RxInt abaSelecionada = 0.obs;

  RxList<ItensMenuModel> itensMenu = [
    ItensMenuModel(
      chave: "home",
      icone: LucideIcons.house,
      tela: DashboardPage(),
    ),
    ItensMenuModel(
      chave: "vendas",
      icone: LucideIcons.badge_dollar_sign,
      tela: const Center(
        child: AppText(text: "Vendas", color: AppColors.darkMocha240),
      ),
    ),
    ItensMenuModel(
      chave: "caixa",
      icone: LucideIcons.box,
      tela: const Center(
        child: AppText(text: "Caixa", color: AppColors.darkMocha240),
      ),
    ),
    ItensMenuModel(
      chave: "carrinho",
      icone: LucideIcons.shopping_cart,
      tela: const Center(
        child: AppText(text: "Carrinho", color: AppColors.darkMocha240),
      ),
    ),
    ItensMenuModel(
      chave: "clientes",
      icone: LucideIcons.users,
      tela: const Center(
        child: AppText(text: "Clientes", color: AppColors.darkMocha240),
      ),
    ),
    // ItensMenuModel(
    //   chave: "relatorios",
    //   icone: LucideIcons.chart_no_axes_combined,
    //   tela: const Center(
    //     child: AppText(text: "Relatorios", color: AppColors.darkMocha240),
    //   ),
    // ),
    ItensMenuModel(
      chave: "configuracoes",
      icone: LucideIcons.settings,
      tela: const SettingsPages(),
    ),
  ].obs;

  void mudarAbas(int index) {
    abaSelecionada.value = index;
    update();
  }

  ItensMenuModel get itemAtual => itensMenu[abaSelecionada.value];

  void sair() {
    Get.offAllNamed(Routes.initial);
  }

  void mudarAmbiente() {
    Get.offAllNamed(Routes.selectBox);
  }
}
