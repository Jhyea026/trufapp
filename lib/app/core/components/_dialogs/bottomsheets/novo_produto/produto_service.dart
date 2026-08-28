import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProdutoService {
  final SupabaseClient _client = Supabase.instance.client;

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

  Future<void> salvarProduto({
    String? id,
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
