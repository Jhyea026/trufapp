import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class HourGlassAnimate extends StatefulWidget {
  const HourGlassAnimate({super.key});

  @override
  State<HourGlassAnimate> createState() => _HourGlassAnimateState();
}

class _HourGlassAnimateState extends State<HourGlassAnimate>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(); // O "..repeat()" inicia o loop infinito direto na criação

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Controla a rotação nativamente recebendo apenas o controller
    return RotationTransition(
      turns: _controller,
      child: Icon(
        LucideIcons.hourglass,
        size: 45,
        color: AppColors.darkMocha410.withValues(alpha: 0.70),
      ),
    );
  }
}
