import 'package:flutter/material.dart';

class Hovertest extends StatefulWidget {
  const Hovertest({super.key});

  @override
  State<Hovertest> createState() => _HoverFillButtonState();
}

class _HoverFillButtonState extends State<Hovertest> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center( // equivalente ao .wrapper centralizado
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovering = true),
          onExit: (_) => setState(() => isHovering = false),
          child: Container(
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF333333), width: 2),
            ),
            child: Stack(
              children: [

                // 🔴 Fundo animado (equivalente ao :after)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  width: isHovering ? 200 : 0,
                  height: 40,
                  color: const Color(0xFFFF003B),
                ),

                // 🔤 Texto
                Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 350),
                    style: TextStyle(
                      color: isHovering ? Colors.white : const Color(0xFF333333),
                      letterSpacing: 2,
                      fontSize: 18,
                    ),
                    child: const Text("BOTÃO"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
