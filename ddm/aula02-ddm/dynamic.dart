class DynamicSample {
  static const String VERSAO_APP = "1.0.5";
  static const int LIMITE_REQUISICOES = 50;

  void constSample() {
    const double pi = 3.14159;

    // const dataAtual = DateTime.now(); // ERRO: DateTime.now() não é constante de compilação.
  }

  void processarLogin(String emailDigitado) {
    // O valor depende do que foi digitado AGORA (Runtime)
    final String emailFormatado = emailDigitado.toLowerCase().trim();

    // O valor depende do relógio do sistema no momento da execução
    final DateTime horaAcesso = DateTime.now();

    // emailFormatado = "outro@email.com"; // ERRO: Can't be assigned to a final variable.

    print("Usuário $emailFormatado logado em $horaAcesso");
  }

  dynamicSample() {
    dynamic variavel = "Olá";
    variavel = 10; // Permitido
    variavel
        .metodoQueNaoExiste(); // Compila, mas quebra ao rodar (NoSuchMethodError)

    String variavel2 = "Tchau";
    //variavel2.metodoQueNaoExiste();
  }
}
