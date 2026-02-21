import 'package:flutter/material.dart';

BoxShadow customShadow({
  Offset? direcaoShadow = const Offset(0, 4),
  double? valorBlurRadius = 4
  }) {
  return BoxShadow(
    offset: direcaoShadow!,
    blurRadius: valorBlurRadius!,
    color: Color(0x75000000),
  );
}
