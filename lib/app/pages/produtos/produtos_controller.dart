import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trufapp/app/core/components/_dialogs/bottomsheets/novo_produto/produto_service.dart';
import 'package:trufapp/app/core/models/produto_model.dart';

class ProdutosController extends GetxController {
  final ProdutoService _produtoService = ProdutoService();

  final RxList<Produto> produtos = <Produto>[].obs;
  final RxBool carregando = false.obs;
  final RxString termoBusca = ''.obs;
  final buscaController =
      TextEditingController(); // 👈 fixo, não recriar no build

  @override
  void onInit() {
    super.onInit();
    carregarProdutos();
  }

  Future<void> carregarProdutos() async {
    try {
      carregando.value = true;
      final lista = await _produtoService.listarProdutos(
        termoBusca: termoBusca.value,
      );
      produtos.assignAll(lista);
    } catch (e) {
      Get.snackbar('Erro', 'Não foi possível carregar os produtos: $e');
    } finally {
      carregando.value = false;
    }
  }

  void buscar(String termo) {
    termoBusca.value = termo;
    carregarProdutos();
  }

  @override
  void onClose() {
    buscaController.dispose();
    super.onClose();
  }
}
