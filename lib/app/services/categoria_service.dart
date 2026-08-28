import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trufapp/app/core/models/categoria_model.dart';

class CategoriaService {
  final SupabaseClient _client = Supabase.instance.client;

  /// Busca todas as categorias ATIVAS, ordenadas por nome.
  Future<List<Categoria>> listarCategorias() async {
    try {
      final response = await _client
          .from('categoria')
          .select('id, nome')
          .eq('ativo', true)
          .order('nome', ascending: true);

      return (response as List)
          .map((item) => Categoria.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception('Erro ao buscar categorias: $e');
    }
  }
}
