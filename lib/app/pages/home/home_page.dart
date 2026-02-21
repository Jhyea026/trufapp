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
        return Scaffold(
          backgroundColor: AppColors.lightMocha10,
          appBar: AppBar(
            toolbarHeight: 70,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
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
                    child: Container(
                      child: homeController
                          .itensMenu[homeController.abaSelecionada.value]
                          .tela,
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
                          children: List.generate(
                            homeController.itensMenu.length,
                            (index) {
                              return CustomIconButtonNavigation(
                                onTap: () =>
                                    homeController.mudarAbas(index),
                                icone:
                                    homeController.itensMenu[index].icone,
                                corIcone:
                                    homeController.abaSelecionada.value ==
                                        index
                                    ? AppColors.darkMocha410
                                    : Colors.white,
                                cor:
                                    homeController.abaSelecionada.value ==
                                        index
                                    ? Colors.white
                                    : Colors.transparent,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
