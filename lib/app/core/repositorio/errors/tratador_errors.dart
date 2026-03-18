String tratadorErrors(int errorCodigo) {
  switch (errorCodigo) {
    case 400:
      return 'Erro 400: Requisição inválida';
    case 401:
      return 'Erro 401: Não autorizado';
    case 403:
      return 'Erro 403: Proibido';
    case 404:
      return 'Erro 404: Não encontrado';
    case 500:
      return 'Erro 500: Erro interno do servidor';
    default:
      return 'Erro desconhecido: $errorCodigo';
  }
}
