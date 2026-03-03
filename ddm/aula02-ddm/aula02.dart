void main() {
  // No Dart, tudo é um objeto, inclusime os tipos númericos. Todos herdam de Object?.
  int inteiro = 1;
  double flutuante = 1.0;
  num soma = inteiro + flutuante;

  String palavra = "teste";
  bool booleano = true;

  // Variáveis declarativas
  // Assinatura: Tipo nome = valor;
  String servidor = "https://api.v1.com";
  int porta = 8080;
  bool sslAtivo = true;

  // Com Null Safety (Nullable)
  String? mensagemDeErro; // Pode ser nulo

  // Variáveis por inferência
  var taxa = 0.15;
  var teste = null; // Dynamic

  Object objeto = "Olá Mundo";
  // O Dart só vê um 'Object' (genérico).
  // Ele não te deixa usar .length porque Objects não têm tamanho.
  // Você usa o 'as' para avisar que aquele Object é, na verdade, uma String.
  print((objeto as String).length);

  Object valor = 10;
  int valor2 = int.parse(valor.toString());

  // Casting
  num a = 1;
  String b = "2";
  a = a + int.parse(b);

  String entrada = "abc";
  int? novoValor = int.tryParse(entrada); // Retorna null em vez de erro

  if (novoValor != null) {
    print("Sucesso: $novoValor");
  } else {
    print("Não foi possível converter.");
  }

  Object meuObjeto = "Olá";
  // Erro: imprimir(meuObjeto);
  print(meuObjeto as String);

  dynamic newValue = "Olá";

  if (newValue is String) {
    print("É uma string!"); // O Dart faz Smart Cast aqui dentro
  }
}
