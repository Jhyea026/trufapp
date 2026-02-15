import 'package:flutter/material.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/components/custom_text_field.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 48, 48, 48),
                Color.fromARGB(255, 0, 0, 0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              AppText(
                text: "Login",
                color: Colors.white,
                fontSize: 24,
                fontWeight: AppFontsWeight.light,
              ),
              CustomTextField(
                controller: TextEditingController(),
                hintText: "Email",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
