import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_button.dart';
import 'package:trufapp/app/core/components/custom_text_field.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';
import 'package:trufapp/app/utils/custom_shadow.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(color: AppColors.lightMocha10),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset('assets/images/TrufApp_logo.png'),
                  Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    decoration: BoxDecoration(
                      color: AppColors.darkMocha410,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        customShadow()
                      ]
                    ),
                    padding: EdgeInsets.fromLTRB(17, 20, 17, 21),
                    child: Column(
                      spacing: 15,
                      children: [
                        AppText(
                          text: "Login",
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: AppFontsWeight.regular,
                        ),
                        Column(
                          spacing: 10,
                          children: [
                            CustomTextField(
                              controller: TextEditingController(),
                              hintText: "Login",
                            ),
                            CustomTextField(
                              hintText: 'Senha',
                              obscure: true,
                              controller: TextEditingController(),
                            ),
                          ],
                        ),
                        CustomButton(
                          texto: 'Entrar',
                          corFundo: AppColors.lightMocha10,
                          mostraBorda: false,
                          carregando: false,
                          acao: () {
                            Get.offNamed(Routes.selectBox);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AppText(
                  text: '© 2025 TrufApp. Todos os direitos reservados.',
                  color: AppColors.darkMocha240,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
