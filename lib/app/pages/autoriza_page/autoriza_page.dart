import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/animations/hourglass_animate.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

/// Shown right after registration, informing the user their account is
/// pending approval before they can access the app.
class AutorizaPage extends StatelessWidget {
  const AutorizaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightMocha10,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              SizedBox(height: 60),
              // Logo asset from Figma (candy + "TrufApp" wordmark baked into
              // the same image). Download it and place it under
              // assets/images/truf_logo.png, then register it in pubspec.yaml.
              Image.asset(
                'assets/images/TrufApp_logo.png',
                width: 180,
                height: 180,
                fit: BoxFit.contain,
              ),

              // Icon badge — a plain tinted circle with a border, so it's
              // recreated natively instead of shipping it as an image asset.
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.darkMocha410.withValues(alpha: 0.15),
                  border: Border.all(
                    color: AppColors.darkMocha410.withValues(alpha: 0.40),
                    width: 1.5,
                  ),
                ),
                alignment: Alignment.center,
                child: HourGlassAnimate(),
              ),
              SizedBox(height: 24),

              Text(
                'Conta em análise',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: AppColors.darkMocha410,
                ),
              ),
              SizedBox(height: 24),

              // Status chip
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.darkMocha410.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'AGUARDANDO APROVAÇÃO',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    letterSpacing: 0.6,
                    color: AppColors.darkMocha410,
                  ),
                ),
              ),
              SizedBox(height: 24),

              Text(
                'Recebemos o seu cadastro! Estamos analisando '
                'suas informações e você vai receber acesso assim que for '
                'aprovado.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 15,
                  height: 1.4,
                  color: AppColors.darkMocha240.withValues(alpha: 0.7),
                ),
              ),
              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offNamed(Routes.login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkMocha410,
                    padding: EdgeInsets.symmetric(vertical: 26),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'VOLTAR PARA LOGIN',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 1,
                      color: AppColors.lightMocha10,
                    ),
                  ),
                ),
              ),
              Spacer(),

              Text(
                '© 2026 TrufApp. Todos os direitos reservados.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
