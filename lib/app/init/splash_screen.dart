import 'package:flutter/material.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: AppColors.darkMocha130),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/TrufApp_logo.png'),
            SizedBox(height: 72),
            const CircularProgressIndicator(color: AppColors.darkMocha460,),
          ],
        ),
      ),
    );
  }
}
