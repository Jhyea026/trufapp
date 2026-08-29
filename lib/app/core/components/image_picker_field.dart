// ignore_for_file: deprecated_member_use

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trufapp/app/core/components/apptext.dart';
import 'package:trufapp/app/core/theme/app_colors.dart';
import 'package:trufapp/app/core/theme/app_fonts_weight.dart';

class ImagePickerField extends StatefulWidget {
  final void Function(Uint8List? bytes, String? nomeArquivo)?
  onImagemSelecionada;
  final String? imagemUrlAtual;

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

  Future<void> _selecionarImagem() async {
    final picker = ImagePicker();

    final XFile? imagem = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 1024,
    );

    if (imagem == null) return;

    final bytes = await imagem.readAsBytes();

    setState(() {
      _imagemBytes = bytes;
    });

    widget.onImagemSelecionada?.call(bytes, imagem.name);
  }

  void _removerImagem() {
    setState(() {
      _imagemBytes = null;
    });

    widget.onImagemSelecionada?.call(null, null);
  }

  @override
  Widget build(BuildContext context) {
    final bool temImagem =
        _imagemBytes != null || widget.imagemUrlAtual != null;

    return Center(
      child: SizedBox(
        width: 120,
        height: 120,
        child: temImagem ? _buildImagem() : _buildAdicionarImagem(),
      ),
    );
  }

  /// Área exibida quando NÃO existe imagem
  Widget _buildAdicionarImagem() {
    return GestureDetector(
      onTap: _selecionarImagem,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.darkMocha240, width: 1.2),
          color: AppColors.lightMocha10,
        ),
        child: Column(
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
    );
  }

  Widget _buildImagem() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: _selecionarImagem,
              child: _imagemBytes != null
                  ? Image.memory(_imagemBytes!, fit: BoxFit.cover)
                  : Image.network(widget.imagemUrlAtual!, fit: BoxFit.cover),
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
                  child: const Icon(Icons.close, size: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
