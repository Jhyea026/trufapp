class ResultadoApiModelo {
  final String menssagem;
  final bool sucesso;
  final int codigoRetorno;
  final Map<String, dynamic> dados;

  ResultadoApiModelo({
    required this.menssagem,
    required this.sucesso,
    required this.codigoRetorno,
    required this.dados,
  });
}
