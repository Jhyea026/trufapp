import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/models/categoria_model.dart';
import 'package:trufapp/app/services/categoria_service.dart';
import 'produto_service.dart';

class NovoProdutoController extends GetxController {
  final ProdutoService _produtoService = ProdutoService();
  final CategoriaService _categoriaService = CategoriaService();
  final Rxn<Uint8List> imagemProduto = Rxn<Uint8List>();
  String? _nomeArquivoImagem;
  final RxBool carregando = false.obs;
  final RxList<Categoria> categorias = <Categoria>[].obs;
  final RxBool carregandoCategorias = false.obs;
  final nomeController = TextEditingController();
  final saborController = TextEditingController();
  final pesoController = TextEditingController();
  final estoqueController = TextEditingController();
  final pontosController = TextEditingController();
  final precoController = TextEditingController();
  int? categoriaSelecionada; // agora é int, pois categoria.id é bigint

  @override
  void onInit() {
    super.onInit();
    _carregarCategorias();
  }

  Future<void> _carregarCategorias() async {
    try {
      carregandoCategorias.value = true;
      final lista = await _categoriaService.listarCategorias();
      categorias.assignAll(lista);
    } catch (e) {
      Get.snackbar('Erro', 'Não foi possível carregar as categorias: $e');
    } finally {
      carregandoCategorias.value = false;
    }
  }

  void definirImagem(Uint8List? bytes, String? nomeArquivo) {
    imagemProduto.value = bytes;
    _nomeArquivoImagem = nomeArquivo;
  }

  List<String> _validarCampos() {
    final erros = <String>[];

    if (nomeController.text.trim().isEmpty) {
      erros.add('Informe o nome do produto');
    }
    if (categoriaSelecionada == null) {
      erros.add('Selecione uma categoria');
    }

    final preco = double.tryParse(precoController.text.replaceAll(',', '.'));
    if (preco == null || preco <= 0) {
      erros.add('Informe um preço válido');
    }

    return erros;
  }

  /// Chama a validação antes de salvar. Use este método no botão.
  Future<void> salvarComValidacao({String? idProdutoEdicao}) async {
    final erros = _validarCampos();

    if (erros.isNotEmpty) {
      Get.snackbar(
        'Corrija os campos',
        erros.join('\n'),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
        duration: const Duration(seconds: 4),
      );
      return; // não prossegue pro salvamento
    }

    await salvar(idProdutoEdicao: idProdutoEdicao);
  }

  Future<void> salvar({String? idProdutoEdicao}) async {
    try {
      carregando.value = true;

      String? urlImagem;

      if (imagemProduto.value != null) {
        urlImagem = await _produtoService.uploadImagem(
          imagemProduto.value!,
          nomeArquivo: _nomeArquivoImagem ?? 'produto.jpg',
        );
      }

      await _produtoService.salvarProduto(
        id: idProdutoEdicao,
        nome: nomeController.text.trim(),
        sabor: saborController.text.trim().isEmpty
            ? null
            : saborController.text.trim(),
        idCategoria: categoriaSelecionada,
        pesoG: double.tryParse(pesoController.text.replaceAll(',', '.')),
        pontosResgate: int.tryParse(pontosController.text),
        preco: double.tryParse(precoController.text.replaceAll(',', '.')) ?? 0,
        imagemUrl: urlImagem,
      );

      Get.back();
      Get.snackbar('Sucesso', 'Produto salvo com sucesso!');
    } catch (e) {
      Get.snackbar('Erro', 'Não foi possível salvar o produto: $e');
    } finally {
      carregando.value = false;
    }
  }

  @override
  void onClose() {
    nomeController.dispose();
    saborController.dispose();
    pesoController.dispose();
    estoqueController.dispose();
    pontosController.dispose();
    precoController.dispose();
    super.onClose();
  }
}
