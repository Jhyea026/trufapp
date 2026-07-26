import 'package:flutter/material.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

/// Reusable "floating label inside a tinted box" text field.
///
/// This replaces the app's previous bordered inputs. Drop this widget
/// anywhere a text input is needed — login, register, forms, filters, etc.
/// The visual style (label, spacing, colors, radius) lives in ONE place,
/// so future design tweaks only need to happen here.
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onChanged,
    this.enabled = true,
  });

  /// Small bold label rendered above the value, e.g. "Nome", "E-mail".
  final String label;

  final TextEditingController? controller;

  /// Set to true for password-style fields. Adds a show/hide toggle.
  final bool obscureText;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final bool enabled;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscured = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.darkMocha410.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.darkMocha410.withValues(alpha: 0.35),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 0.4,
              color: AppColors.darkMocha410,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  obscureText: _obscured,
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                  enabled: widget.enabled,
                  style: const TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 16,
                    color: AppColors.darkMocha240,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              if (widget.obscureText)
                GestureDetector(
                  onTap: () => setState(() => _obscured = !_obscured),
                  child: Icon(
                    _obscured ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                    color: AppColors.darkMocha220,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
