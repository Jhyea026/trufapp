import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:trufapp/app/core/models/categoria_model.dart';
import 'package:trufapp/app/pages/produtos/produtos_controller.dart';
import 'package:trufapp/app/services/categoria_service.dart';

import 'produto_service.dart';

class NovoProdutoController extends GetxController {
  final ProdutoService _produtoService = ProdutoService();
  final CategoriaService _categoriaService = CategoriaService();

  final Rxn<Uint8List> imagemProduto = Rxn<Uint8List>();

  String? _nomeArquivoImagem;

  // Imagem que já estava salva no produto
  String? imagemUrlAtual;

  final RxBool carregando = false.obs;
  final RxBool carregandoProduto = false.obs;

  final RxList<Categoria> categorias = <Categoria>[].obs;
  final RxBool carregandoCategorias = false.obs;

  final nomeController = TextEditingController();
  final saborController = TextEditingController();
  final pesoController = TextEditingController();
  final estoqueController = TextEditingController();
  final pontosController = TextEditingController();
  final precoController = TextEditingController();

  int? categoriaSelecionada;

  // 👇 era String?, agora int? (produto.id é bigint sequencial)
  final int? idProdutoEdicao;

  NovoProdutoController({this.idProdutoEdicao});

  @override
  void onInit() {
    super.onInit();

    _inicializar();
  }

  Future<void> _inicializar() async {
    // Carrega categorias primeiro
    await _carregarCategorias();

    // Se tiver ID, estamos editando
    if (idProdutoEdicao != null) {
      await carregarProdutoParaEdicao();
    }
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

  Future<void> carregarProdutoParaEdicao() async {
    if (idProdutoEdicao == null) return;

    try {
      carregandoProduto.value = true;

      final produto = await _produtoService.buscarProdutoPorId(
        idProdutoEdicao!,
      );

      nomeController.text = produto.nome;

      saborController.text = produto.sabor ?? '';

      pesoController.text = produto.pesoG != null
          ? produto.pesoG!.toString()
          : '';

      pontosController.text = produto.pontosResgate != null
          ? produto.pontosResgate!.toString()
          : '';

      precoController.text = produto.preco
          .toStringAsFixed(2)
          .replaceAll('.', ',');

      categoriaSelecionada = produto.idCategoria;

      imagemUrlAtual = produto.imagemUrl;

      update();
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Não foi possível carregar o produto: $e',
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      carregandoProduto.value = false;
      update(); // 👈 garante que o GetBuilder reconstrói e tira o loading da tela
    }
  }

  void definirImagem(Uint8List? bytes, String? nomeArquivo) {
    imagemProduto.value = bytes;
    _nomeArquivoImagem = nomeArquivo;

    update();
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

  // 👇 SEM parâmetro próprio: usa sempre o campo idProdutoEdicao da classe,
  // que já veio corretamente do construtor (evita o bug de shadowing).
  Future<void> salvarComValidacao() async {
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

      return;
    }

    await salvar();
  }

  Future<void> salvar() async {
    try {
      carregando.value = true;

      String? urlImagem;

      if (imagemProduto.value != null) {
        urlImagem = await _produtoService.uploadImagem(
          imagemProduto.value!,
          nomeArquivo: _nomeArquivoImagem ?? 'produto.jpg',
        );
      } else {
        // mantém a imagem já existente se o usuário não trocou nenhuma nova
        urlImagem = imagemUrlAtual;
      }

      await _produtoService.salvarProduto(
        id: idProdutoEdicao, // 👈 agora vem sempre do campo da classe
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

      Get.snackbar(
        'Sucesso',
        idProdutoEdicao == null
            ? 'Produto criado com sucesso!'
            : 'Produto atualizado com sucesso!',
      );

      if (Get.isRegistered<ProdutosController>()) {
        Get.find<ProdutosController>().carregarProdutos();
      }
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
