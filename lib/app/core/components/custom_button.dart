import 'package:flutter/material.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';
import 'package:trufapp/app/utils/custom_shadow.dart';

class CustomButton extends StatefulWidget {
  final Widget? filho;
  final String? texto;
  final double? largura, altura;
  final bool carregando, mostraBorda, mostraSombra;
  final Color? corFundo, corTexto, corHover;
  final VoidCallback? acao;

  const CustomButton({
    super.key,
    this.filho,
    this.texto,
    this.largura,
    this.altura,
    this.carregando = false,
    this.mostraBorda = true,
    this.mostraSombra = false,
    this.corFundo,
    this.acao,
    this.corTexto, this.corHover,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.acao,
      onHover: (isHovering) {
        setState(() {
          hover = isHovering;
        });
      },
      child: Container(
        width: widget.largura ?? double.infinity,
        height: widget.altura ?? 40,
        decoration: BoxDecoration(
          color: hover 
          ? widget.corHover??AppColors.darkMocha130
          : widget.corFundo,
          border: widget.mostraBorda
              ? Border.all(color: AppColors.darkMocha420)
              : null,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: widget.mostraSombra?[
            customShadow()
          ]: []
        ),
        child: widget.carregando
            ? Center(
                widthFactor: 4,
                heightFactor: 4,
                child: CircularProgressIndicator(color: AppColors.darkMocha410),
              )
            : Center(
                child:
                    widget.filho ??
                    AppText(
                      color: widget.corTexto ?? AppColors.darkMocha420,
                      text: widget.texto ?? '',
                      fontSize: 20,
                      fontWeight: AppFontsWeight.regular,
                    ),
              ),
      ),
    );
  }
}
