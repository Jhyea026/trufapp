import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trufapp/app/core/models/produto_model.dart';

class ProdutoService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Produto>> listarProdutos({String? termoBusca}) async {
    try {
      var query = _client
          .from('produto')
          .select('*, categoria(nome)')
          .eq('ativo', true);

      if (termoBusca != null && termoBusca.trim().isNotEmpty) {
        query = query.ilike('nome', '%${termoBusca.trim()}%');
      }

      final response = await query.order('nome', ascending: true);

      return (response as List).map((item) => Produto.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar produtos: $e');
    }
  }

  Future<String?> uploadImagem(
    Uint8List bytes, {
    required String nomeArquivo,
  }) async {
    try {
      final extensao = nomeArquivo.contains('.')
          ? nomeArquivo.split('.').last
          : 'jpg';
      final caminho = '${DateTime.now().millisecondsSinceEpoch}.$extensao';

      await _client.storage
          .from('produtos')
          .uploadBinary(
            caminho,
            bytes,
            fileOptions: FileOptions(
              upsert: true,
              contentType: 'image/$extensao',
            ),
          );

      final url = _client.storage.from('produtos').getPublicUrl(caminho);
      return url;
    } catch (e) {
      throw Exception('Erro ao enviar imagem: $e');
    }
  }

  Future<Produto> buscarProdutoPorId(int id) async {
    try {
      final response = await _client
          .from('produto')
          .select('*, categoria(nome)')
          .eq('id', id)
          .single();

      return Produto.fromJson(response);
    } catch (e) {
      throw Exception('Erro ao buscar produto: $e');
    }
  }

  Future<void> salvarProduto({
    int? id,
    required String nome,
    String? sabor,
    int? idCategoria,
    double? pesoG,
    int? pontosResgate,
    required double preco,
    String? imagemUrl,
  }) async {
    final dados = {
      'nome': nome,
      'sabor': sabor,
      'id_categoria': idCategoria,
      'peso_g': pesoG,
      'pontos_resgate': pontosResgate,
      'preco': preco,
      'ativo': true,
      if (imagemUrl != null) 'imagem_url': imagemUrl,
    };

    if (id == null) {
      await _client.from('produto').insert(dados);
    } else {
      await _client.from('produto').update(dados).eq('id', id);
    }
  }
}
