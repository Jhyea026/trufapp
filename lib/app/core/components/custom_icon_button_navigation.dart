import 'package:flutter/material.dart';

class CustomIconButtonNavigation extends StatefulWidget {
  final VoidCallback onTap;
  final Color cor;
  final IconData icone;
  final Color corIcone;

  const CustomIconButtonNavigation({
    super.key,
    required this.onTap,
    required this.cor,
    required this.icone,
    required this.corIcone,
  });

  @override
  State<CustomIconButtonNavigation> createState() =>
      _CustomIconButtonNavigationState();
}

class _CustomIconButtonNavigationState
    extends State<CustomIconButtonNavigation> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      cursor: SystemMouseCursors.click,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isHover ? widget.cor.withValues(alpha: 0.85) : widget.cor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              widget.icone,
              size: isHover ? 34 : 32,
              color: widget.corIcone,
            ),
          ),
        ),
      ),
    );
  }
}
