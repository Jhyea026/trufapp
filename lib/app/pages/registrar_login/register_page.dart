import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:trufapp/app/core/components/app_text_field.dart';
import 'package:trufapp/app/core/routes/pages_routes.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      Get.offNamed(Routes.autorizar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightMocha10,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        // Logo asset from Figma (candy + "TrufApp" wordmark baked into
                        // the same image). Download it and place it under
                        // assets/images/truf_logo.png, then register it in pubspec.yaml.
                        Image.asset(
                          'assets/images/TrufApp_logo.png',
                          width: 300,
                          height: 300,
                          fit: BoxFit.contain,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Criar conta',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: AppColors.darkMocha410,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 48,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: AppColors.darkMocha410,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),

                        // All four fields now share ONE component: AppTextField.
                        AppTextField(
                          label: 'Nome',
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          validator: (v) => (v == null || v.isEmpty)
                              ? 'Informe seu nome'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        AppTextField(
                          label: 'Nome de usuário',
                          controller: _usernameController,
                          textInputAction: TextInputAction.next,
                          validator: (v) => (v == null || v.isEmpty)
                              ? 'Informe um usuário'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        AppTextField(
                          label: 'E-mail',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (v) => (v == null || !v.contains('@'))
                              ? 'Informe um e-mail válido'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        AppTextField(
                          label: 'Senha',
                          controller: _passwordController,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          validator: (v) => (v == null || v.length < 6)
                              ? 'Mínimo de 6 caracteres'
                              : null,
                        ),
                        const SizedBox(height: 28),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _onSubmit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.darkMocha410,
                              padding: const EdgeInsets.symmetric(vertical: 26),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'CRIAR CONTA',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 1.2,
                                color: AppColors.lightMocha10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.offNamed(Routes.login);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Já tem conta? ',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 15,
                              color: AppColors.darkMocha410.withValues(
                                alpha: 0.75,
                              ),
                            ),
                          ),
                          Text(
                            'Entrar',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: AppColors.darkMocha410,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    '© 2025 TrufApp. Todos os direitos reservados.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
