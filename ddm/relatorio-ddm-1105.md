# Relatório de Aula — 11/05/2026

**Instituto Federal do Paraná (IFPR)**  
**Disciplina:** Desenvolvimento para Dispositivos Móveis (DDM)

| | |
|---|---|
| **Alunos** | Brayan Barros, Gabriel Lucim |
| **Professor** | Hélio Kamakawa |

---

## Critérios de Avaliação

### 1. Implementação prática de quatro cadastros funcionando

O projeto deve ter quatro cadastros funcionando. Este é um **pré-requisito** — sem essa implementação prática, os demais elementos não serão avaliados.

### 2. Code review do DAO com associação

O code review do DAO com associação será usado para definir conceito. O objetivo é verificar se o estudante compreende:

- a entidade principal
- a entidade associada
- o relacionamento entre elas
- o uso de chave estrangeira
- a consulta com associação
- o mapeamento dos dados retornados
- a responsabilidade do DAO

### 3. Vídeo da classe de conexão

O vídeo da classe de conexão também será usado para definir conceito, com o objetivo de verificar **domínio sem consulta**. Será observado se o estudante consegue:

- escrever a classe de conexão em sequência
- manter o código legível e com indentação adequada
- explicar a estrutura geral
- demonstrar compreensão do papel da conexão no projeto

---

## O Que Será Desenvolvido

### Conteúdo geral

O tema geral é **persistência de dados em aplicativos Flutter**, com foco principal em:

- classe de conexão
- DAO simples
- DAO com associação

### Conteúdos específicos

Para conseguir desenvolver a persistência do aplicativo, também serão necessários alguns fundamentos:

- programação assíncrona
- uso de bibliotecas pelo pub.dev
- envio de dados de um widget para outro e de uma tela para outra
- uso de `DropdownButton`
- exibição de dados em componentes visuais
- envio de objetos a partir de componentes visuais

### Classe de conexão

Além do código em si, serão trabalhados os seguintes conceitos:

- persistência local, remota e sincronização de dados
- SQL — criação do banco e das tabelas
- versionamento do banco
- padrão Singleton

### DAO simples e DAO com associação

O foco será compreender:

- onde ficam os comandos SQL
- como inserir, consultar, atualizar e excluir dados
- como evitar SQL espalhado pelas telas
- como mapear dados do banco para objetos (e vice-versa)
- como trabalhar com associação entre entidades
- como escrever consultas com dados relacionados

---

## Pré-Requisitos

- No mínimo **2 CRUDs simples** e **2 CRUDs de associação** funcionando
- Mínimo de **4 modelos**
- Mínimo de **4 DAOs**
- Mínimo de **4 telas** (geralmente mais de uma por modelo)

---

## Datas Importantes

| Data | Descrição |
|------|-----------|
| **11/05** | Conceitos e termos gerais sobre persistência — aula ministrada pelo professor Hélio |
| **18/05** | Pint of Science — presença no evento substitui a aula |
| **25/05** | Desenvolvimento do projeto e code review — aula livre até às 21h10, seguida da prática de code review no Moodle (questão aberta: escrever um DAO com associação e comentários explicativos) |
| **01/06** | Entrega do projeto — envio do vídeo da classe de conexão para avaliação |

### Critérios para o vídeo (entrega em 01/06)

- A pessoa deve aparecer, pelo menos no início do vídeo
- Se possível, mostrar o ambiente indicando ausência de meios de consulta
- O vídeo não deve ter cortes
- A escrita deve acontecer de forma sequencial
- O estudante não deve parar longamente para lembrar ou consultar
- O código deve estar legível e devidamente indentado
- Ao final, o estudante deve explicar o código de forma geral

---

## Conceitos Fundamentais de Persistência

### Tipos de persistência

Existem 3 tipos de persistência:

- **Local** — os dados ficam no próprio dispositivo
- **Remota** — os dados ficam em um servidor
- **Sincronizada** — os dados existem tanto no dispositivo quanto no servidor

### Comparativo

| Critério | Local | Remota / API | Sincronizada |
|----------|-------|--------------|--------------|
| Onde fica o BD | Dispositivo | Servidor | Dispositivo e servidor |
| Velocidade | Rápida no dispositivo | Depende da rede | Depende do caso |
| Uso offline | Funciona melhor | Depende de conexão | Pode funcionar offline |
| Segurança | Exige cuidado no aparelho | Tende a ter mais controle no servidor | Exige cuidado nos dois lados |
| Manutenção | Pode exigir migrações no app | Centralizada no backend | Mais complexa |
| Dados compartilhados | Mais difícil | Mais adequada | Possível, mas exige controle |
| Quem cria as tabelas | App | Equipe do backend | App local e equipe do backend |
| Quem mantém o BD | App | Equipe do backend | App e backend |
| Como muda o BD | Atualização do app | Alteração no servidor | Atualização do app e/ou servidor |
| App verifica estrutura? | Sim | Não (para o banco remoto) | Sim (para a parte local) |

---

## Funcionamento de Persistência em Aplicações Flutter

### Visão geral

```
Aplicativo
├── Biblioteca/Driver → conexão com o banco
├── SQL (DDL + DML)
├── Organização do código (Model, DAO, Repository)
└── Mapeamento (Model ↔ Tabela)
```

### Conexão

Caminho pelo qual o app acessa o banco. Define:

- onde o banco está
- como abri-lo e qual versão usar
- o que fazer ao criar ou atualizar o banco

> **Boa prática:** ter um ponto central para controlar a abertura e o uso do banco.

### Biblioteca e driver

O app não acessa o banco diretamente — usa uma biblioteca (ex: `sqflite` no Flutter):

```
App → Biblioteca → Driver → Banco
```

### SQL

| Tipo | Nome completo | Função | Exemplos |
|------|---------------|--------|----------|
| **DDL** | Data Definition Language | Define estrutura | `CREATE TABLE`, `ALTER TABLE` |
| **DML** | Data Manipulation Language | Manipula dados | `INSERT`, `SELECT`, `UPDATE`, `DELETE` |

### Organização do código

**Model** — Classe que representa uma entidade do app (ex: `Estado`, `Produto`). Evita dados soltos (`Map`, strings avulsas) espalhados pelo código.

```
Estado
├── id
├── nome
└── sigla
```

**DAO (Data Access Object)** — Centraliza o SQL de uma entidade. Recebe e devolve objetos model.

```
Tela → DAO → Banco
```

Métodos típicos: `inserir`, `listar`, `buscarPorId`, `atualizar`, `excluir`

**Repository** — Organiza a fonte dos dados em nível mais alto. Decide de onde vêm:

```
Tela → Repository → DAO / API / Cache
```

### DAO vs Repository

| Estrutura | Foco |
|-----------|------|
| DAO | Acesso direto ao banco e ao SQL |
| Repository | Fonte de dados usada pelo app |

### MOR / ORM

Mapeamento Objeto-Relacional — converte dados entre model e tabela:

```
Model → Map → SQL
SQL   → Map → Model
```

### Resumo rápido

| Conceito | Função |
|----------|--------|
| Conexão | Abre e controla o acesso ao banco |
| Biblioteca | Permite o app conversar com o banco |
| DDL | Define estrutura |
| DML | Manipula dados |
| Model | Representa uma entidade |
| DAO | Organiza o SQL |
| Repository | Organiza a fonte de dados |
| MOR | Converte model ↔ tabela |

---

## Async/Await em Dart

### Conceito

A técnica de `async/await` se baseia em processar eventos de maneira **assíncrona**, a fim de tratar cenários em que o fluxo síncrono seria ineficiente, desbloqueando o processamento e aumentando o desempenho.

### Termos-chave

| Termo | Papel |
|-------|-------|
| `Future` | Declara o tipo de retorno da função assíncrona |
| `async` | Declara que a função é assíncrona |
| `await` | Indica onde será necessário aguardar o fluxo de dados |

### Exemplos

#### 1. Sem async/await — usando `.then` e `.catchError`

Neste formato, funções são encadeadas e executadas quando o valor estiver pronto.

```dart
void buscarUsuario() {
  print("1. Iniciando busca...");

  Future.delayed(Duration(seconds: 2), () => "Brayan Barros")
    .then((nome) {
      print("2. Usuário encontrado: $nome");
    })
    .catchError((erro) {
      print("Erro ao buscar: $erro");
    })
    .whenComplete(() {
      print("3. Operação finalizada.");
    });

  print("4. O código continua rodando enquanto a busca acontece...");
}

void main() {
  buscarUsuario();
}
```

> **Comportamento:** Os passos 1 e 4 são impressos quase instantaneamente. Somente após 2 segundos os passos 2 e 3 aparecem.

#### 2. Com async/await — código limpo

O Dart "pausa" a execução da função naquele ponto até que o `Future` seja resolvido, sem travar o restante do aplicativo.

```dart
Future<void> buscarUsuario() async {
  print("1. Iniciando busca...");

  try {
    String nome = await Future.delayed(Duration(seconds: 2), () => "Brayan Barros");
    print("2. Usuário encontrado: $nome");
  } catch (erro) {
    print("Erro ao buscar: $erro");
  } finally {
    print("3. Operação finalizada.");
  }
}

void main() async {
  await buscarUsuario();
  print("4. Agora eu só apareço depois que tudo terminar!");
}
```

> **Comportamento:** A ordem é rigorosamente 1 → 2 → 3 → 4, pois o `main` também aguarda (`await`) a função terminar.
