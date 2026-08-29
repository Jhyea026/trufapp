class Produto {
  final int id;
  final String nome;
  final String? sabor;
  final double? pesoG;
  final double preco;
  final int? pontosResgate;
  final String? imagemUrl;
  final int? idCategoria;
  final String? categoriaNome;

  Produto({
    required this.id,
    required this.nome,
    this.sabor,
    this.pesoG,
    required this.preco,
    this.pontosResgate,
    this.imagemUrl,
    this.idCategoria,
    this.categoriaNome,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'] as int,
      nome: json['nome'] as String,
      sabor: json['sabor'] as String?,
      pesoG: (json['peso_g'] as num?)?.toDouble(),
      preco: (json['preco'] as num).toDouble(),
      pontosResgate: json['pontos_resgate'] as int?,
      imagemUrl: json['imagem_url'] as String?,
      idCategoria: json['id_categoria'] as int?,
      // O join retorna um objeto aninhado: categoria: { nome: '...' }
      categoriaNome:
          (json['categoria'] as Map<String, dynamic>?)?['nome'] as String?,
    );
  }
}
