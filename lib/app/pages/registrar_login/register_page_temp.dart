import 'package:flutter/material.dart';
import 'package:trufapp/app/core/components/app_text_field.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class RegisterTemp extends StatefulWidget {
  const RegisterTemp({super.key});

  @override
  State<RegisterTemp> createState() => _RegisterTempState();
}

class _RegisterTempState extends State<RegisterTemp> {
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
      // hook up to your registration logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            // Logo asset from Figma (candy + "TrufApp" wordmark baked into
            // the same image). Download it and place it under
            // assets/images/truf_logo.png, then register it in pubspec.yaml.
            Image.asset(
              'assets/images/truf_logo.png',
              width: 160,
              height: 160,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 36),

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
                      color: AppColors.lightMocha40,
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
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Informe seu nome' : null,
            ),
            const SizedBox(height: 16),
            AppTextField(
              label: 'Nome de usuário',
              controller: _usernameController,
              textInputAction: TextInputAction.next,
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Informe um usuário' : null,
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
              validator: (v) =>
                  (v == null || v.length < 6) ? 'Mínimo de 6 caracteres' : null,
            ),
            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkMocha410,
                  padding: const EdgeInsets.symmetric(vertical: 16),
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
                    fontSize: 17,
                    letterSpacing: 1.2,
                    color: AppColors.lightMocha10,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Já tem conta? ',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 15,
                    color: AppColors.darkMocha420.withValues(alpha: 0.75),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.darkMocha420,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              '© 2025 TrufApp. Todos os direitos reservados.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
