import 'package:flutter/material.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';
import 'package:trufapp/app/utils/text_style.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onChanged;
  final double? width, height;
  final BorderRadius? borderRadius;
  final Widget Function(bool hasFocus)? prefixBuilder; // <-- mudou aqui
  final Color? borderColor, colorHint, textColor, focusBorderColor, cursorColor;
  final bool obscure;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.width,
    this.height,
    this.prefixBuilder, // <-- mudou aqui
    this.borderColor,
    this.obscure = false,
    this.colorHint,
    this.borderRadius,
    this.textColor,
    this.focusBorderColor,
    this.cursorColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {}); // rebuild pra repintar o prefix quando o foco mudar
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      width: widget.width,
      height: widget.height ?? 56,
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode, // <-- conecta o FocusNode
        onChanged: (value) => widget.onChanged?.call(),
        cursorColor: widget.cursorColor ?? AppColors.lightMocha10,
        obscureText: widget.obscure,
        style: textStyle(
          color: widget.textColor ?? AppColors.lightMocha10,
          fontSize: 18,
          fontWeight: AppFontsWeight.light,
        ),
        decoration: InputDecoration(
          hintStyle: textStyle(
            color: widget.colorHint ?? AppColors.lightMocha10,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.lightMocha10,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
            borderSide: BorderSide(
              color: widget.focusBorderColor ?? AppColors.lightMocha10,
              width: 2,
            ),
          ),
          prefixIcon: widget.prefixBuilder == null
              ? null
              : Padding(
                  padding: const EdgeInsets.only(left: 12, right: 4),
                  child: Center(
                    widthFactor: 1,
                    child: widget.prefixBuilder!(_focusNode.hasFocus),
                  ),
                ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
