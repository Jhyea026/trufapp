// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class Addbuttom extends StatefulWidget {
  final VoidCallback? acao;

  const Addbuttom({super.key, this.acao});

  @override
  State<Addbuttom> createState() => _AddbuttomState();
}

class _AddbuttomState extends State<Addbuttom> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHovering) {
        setState(() {
          hover = isHovering;
        });
      },
      borderRadius: BorderRadius.circular(50),
      onTap: widget.acao,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: hover ? AppColors.darkMocha430 : AppColors.darkMocha460,

        ),
        child: Icon(LucideIcons.plus, size: 32, color: AppColors.lightMocha10,)
      ),
    );
  }
}