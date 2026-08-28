import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class ImagePickerField extends StatefulWidget {
  /// Retorna os bytes da imagem selecionada (funciona em Web e Mobile)
  final void Function(Uint8List? bytes, String? nomeArquivo)?
  onImagemSelecionada;
  final String? imagemUrlAtual; // usado no modo "editar produto"

  const ImagePickerField({
    super.key,
    this.onImagemSelecionada,
    this.imagemUrlAtual,
  });

  @override
  State<ImagePickerField> createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  Uint8List? _imagemBytes;
  String? _nomeArquivo;

  Future<void> _selecionarImagem() async {
    final picker = ImagePicker();
    final XFile? imagem = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 1024,
    );

    if (imagem != null) {
      // readAsBytes funciona igual em Web, Android, iOS e Desktop
      final bytes = await imagem.readAsBytes();
      setState(() {
        _imagemBytes = bytes;
        _nomeArquivo = imagem.name;
      });
      widget.onImagemSelecionada?.call(_imagemBytes, _nomeArquivo);
    }
  }

  void _removerImagem() {
    setState(() {
      _imagemBytes = null;
      _nomeArquivo = null;
    });
    widget.onImagemSelecionada?.call(null, null);
  }

  @override
  Widget build(BuildContext context) {
    final temImagem = _imagemBytes != null || widget.imagemUrlAtual != null;

    return Center(
      child: GestureDetector(
        onTap: _selecionarImagem,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.darkMocha240,
              style: BorderStyle.solid,
              width: 1.2,
            ),
            color: AppColors.lightMocha10,
          ),
          clipBehavior: Clip.antiAlias,
          child: temImagem
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    _imagemBytes != null
                        ? Image.memory(_imagemBytes!, fit: BoxFit.cover)
                        : Image.network(
                            widget.imagemUrlAtual!,
                            fit: BoxFit.cover,
                          ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: _removerImagem,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_a_photo_outlined,
                      color: AppColors.darkMocha240,
                      size: 28,
                    ),
                    const SizedBox(height: 6),
                    AppText(
                      text: 'Adicionar foto',
                      color: AppColors.darkMocha240,
                      fontSize: 12,
                      fontWeight: AppFontsWeight.semiBold,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
