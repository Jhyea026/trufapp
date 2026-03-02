import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_avatar.dart';
import 'package:trufapp/app/core/components/custom_icon_button_navigation.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';
import 'package:trufapp/app/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  // late navigationController homeController;
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) {
        final isConfig = homeController.itemAtual.chave == "configuracoes";
        return LayoutBuilder(
          builder: (context, constraints) {
            return Get.width < 600
                ? _buildMobile(isConfig, homeController)
                : _buildDesktop(isConfig, homeController);
          },
        );
      },
    );
  }

  Widget _buildMobile(bool isConfig, HomeController homeController) {
    return Scaffold(
      backgroundColor: AppColors.lightMocha10,
      appBar: isConfig
          ? null
          : AppBar(
              toolbarHeight: 70,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              titleSpacing: 0,
              title: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  children: [
                    CustomAvatar(
                      size: 56,
                      corFundo: AppColors.darkMocha460,
                      filho: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: AppText(
                          text: "JH",
                          color: AppColors.lightMocha10,
                          fontWeight: AppFontsWeight.semiBold,
                          fontSize: 100,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      spacing: 24,
                      children: [
                        InkWell(
                          onTap: homeController.mudarAmbiente,
                          child: const Icon(
                            LucideIcons.arrow_right_left,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: homeController.sair,
                          child: const Icon(
                            LucideIcons.log_out,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              backgroundColor: AppColors.darkMocha410,
            ),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: Tween<double>(
                          begin: 0.98,
                          end: 1.0,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    child: homeController
                        .itensMenu[homeController.abaSelecionada.value]
                        .tela,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      color: AppColors.darkMocha410,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(homeController.itensMenu.length, (
                        index,
                      ) {
                        return CustomIconButtonNavigation(
                          onTap: () => homeController.mudarAbas(index),
                          icone: homeController.itensMenu[index].icone,
                          corIcone: homeController.abaSelecionada.value == index
                              ? AppColors.darkMocha410
                              : Colors.white,
                          cor: homeController.abaSelecionada.value == index
                              ? Colors.white
                              : Colors.transparent,
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktop(bool isConfig, HomeController homeController) {
    return Scaffold(
      body: Stack(
        children: [
          if (!isConfig)
            Container(
              margin: EdgeInsets.only(left: 102, top: 12, right: 12),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              decoration: BoxDecoration(
                color: AppColors.darkMocha410,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CustomAvatar(
                    size: 56,
                    corFundo: AppColors.darkMocha460,
                    filho: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: AppText(
                        text: "JH",
                        color: AppColors.lightMocha10,
                        fontWeight: AppFontsWeight.semiBold,
                        fontSize: 100,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    spacing: 24,
                    children: [
                      InkWell(
                        onTap: homeController.mudarAmbiente,
                        child: const Icon(
                          LucideIcons.arrow_right_left,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: homeController.sair,
                        child: const Icon(
                          LucideIcons.log_out,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: Get.height,
              width: 80,
              margin: EdgeInsets.only(left: 12, top: 12, bottom: 12),
              decoration: BoxDecoration(
                color: AppColors.darkMocha410,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: List.generate(homeController.itensMenu.length, (
                  index,
                ) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: CustomIconButtonNavigation(
                      onTap: () => homeController.mudarAbas(index),
                      icone: homeController.itensMenu[index].icone,
                      corIcone: homeController.abaSelecionada.value == index
                          ? AppColors.darkMocha410
                          : Colors.white,
                      cor: homeController.abaSelecionada.value == index
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  );
                }),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, animation) {
                    // Fade + Scale (surgir)
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: Tween<double>(
                          begin: 0.98,
                          end: 1.0,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    key: ValueKey(homeController.abaSelecionada.value),
                    padding: EdgeInsets.only(left: 90, top: isConfig ? 0 : 90),
                    child: homeController
                        .itensMenu[homeController.abaSelecionada.value]
                        .tela,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
