import 'package:flutter/material.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';

class CardBottomSheet extends StatelessWidget {
  final Widget filho;

  const CardBottomSheet({
    super.key,
    required this.filho,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkMocha130,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        top: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height * 0.99,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              // Handle
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.darkMocha240.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 16),

              // Conteúdo com scroll
              Flexible(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: filho,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}