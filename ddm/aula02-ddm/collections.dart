class Collections {
  void collectionSample() {
    // Coleções
    Iterable<int> iterableInt = [0, 1, 2];
    List<int> listInt = [0, 1, 2];
    Set<int> setInt = {0, 1, 2};
    Map<int, String> mapInt = {0: "zero", 1: "um", 2: "dois"};

    // Iterable
    // Não possui .add() nem .remove()
    iterableInt.forEach(print);

    // Adicionar elementos
    var novoIterableInt = iterableInt.followedBy([3, 4]);
    novoIterableInt.forEach(print);

    // Transformar
    var texto = iterableInt.map((n) => "Número $n");
    texto.forEach(print);
    List itToList = iterableInt.toList();
    itToList.forEach(print);

    // Acessar elementos
    print(iterableInt.elementAt(1));
    print(iterableInt.first);
    print(iterableInt.last);

    // Regras
    print(iterableInt.firstWhere((n) => n > 0));
    print(iterableInt.any((n) => n == 5));
    print(iterableInt.every((n) => n == 5));

    // List
    // Diferente do Iterable, as operações da List geralmente alteram a própria lista
    listInt.forEach(print);

    // Manipular elementos
    listInt.add(3);
    listInt.addAll([4, 5]);
    listInt.insert(0, -1);

    listInt.remove(-1);
    listInt.removeAt(0);
    listInt.removeLast();
    listInt.removeWhere((n) => n == 4 && n == 5);

    List<int> randomList = [5, 1, 3];
    randomList.sort();
    List<int> listOrdered = randomList;
    listOrdered.forEach(print);
    var listInverted = randomList.reversed.toList();
    listInverted.forEach(print);

    // Acessar elemento;
    listInt[0];

    // Pesquisa
    int listIndex = listInt.indexOf(2);
    print(listIndex);
    bool valueListExist = listInt.contains(5);
    print(valueListExist);

    // Set
    // Não permite duplicados e não garante uma ordem específica
    // Embora o padrão no Dart seja o LinkedHashSet (Mantém a ordem de inserção)

    // Adicionar elementos
    setInt.add(3);
    setInt.addAll([4, 5]);

    // Remover elementos
    setInt.remove(5);
    setInt.removeWhere((n) => n % 2 == 0);

    // Operações com conjuntos
    var conjuntoA = {1, 2, 3};
    var conjuntoB = {3, 4, 5};

    // O que há em comum?
    print(conjuntoA.intersection(conjuntoB));
    // Unir os dois (sem duplicar o 3)
    print(conjuntoA.union(conjuntoB));
    // O que tem no A que não tem no B?
    print(conjuntoA.difference(conjuntoB));

    // Acessar elementos
    setInt.elementAt(0);
    setInt.contains(2);
  }
}
