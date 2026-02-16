import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';
import 'package:trufapp/app/pages/navigation/navigation_controller.dart';

class NavigationPage extends StatelessWidget {
  // late navigationController homeController;
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (navigationController) {
        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            title: Row(
              children: [
                CircleAvatar(
                  child: AppText(
                    text: "JH",
                    color: Colors.black,
                    fontWeight: AppFontsWeight.bold,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => navigationController.sair,
                  child: const Icon(LucideIcons.log_out, color: Colors.white),
                ),
              ],
            ),
            backgroundColor: Colors.blue,
          ),
          body: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: navigationController
                          .itensMenu[navigationController.abaSelecionada.value]
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
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            navigationController.itensMenu.length,
                            (index) {
                              return InkWell(
                                onTap: () => navigationController.mudarAbas(index),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color:
                                        navigationController.abaSelecionada.value ==
                                            index
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    navigationController.itensMenu[index].icone,
                                    size: 32,
                                  ),
                                ),
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
