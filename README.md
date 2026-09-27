# Atividade Prática — Consumo de APIs com Dart

## Integrante

* Luana Silva

## API escolhida

**PokeAPI**

A PokeAPI é uma API pública que fornece informações sobre Pokémon. Ela foi escolhida para desenvolver a aplicação de consulta utilizando Dart.

## Descrição da aplicação

A aplicação foi desenvolvida utilizando **Dart puro, sem Flutter**, e funciona através do terminal.

O sistema permite que o usuário pesquise um Pokémon informando seu nome ou número. A aplicação realiza uma requisição HTTP para a PokeAPI, recebe os dados em formato JSON, converte essas informações para objetos Dart e apresenta os resultados de forma organizada no terminal.

Também é possível consultar vários Pokémon, visualizar o histórico das consultas e limpar o histórico.

## Endpoint utilizado

O endpoint utilizado para consultar um Pokémon é:

```text
https://pokeapi.co/api/v2/pokemon/{nome-ou-id}
```

### Exemplo

Para consultar o Pikachu:

```text
https://pokeapi.co/api/v2/pokemon/pikachu
```

Também é possível consultar utilizando o número:

```text
https://pokeapi.co/api/v2/pokemon/25
```

## Tecnologias utilizadas

* Dart
* Pacote `http`
* PokeAPI
* JSON
* `Future`
* `async`
* `await`

## Estrutura do projeto

```text
atividade_consumo_api/
├── bin/
│   └── atividade_consumo_api.dart
├── lib/
│   ├── models/
│   │   └── pokemon.dart
│   └── services/
│       └── pokemon_service.dart
├── test/
├── pubspec.yaml
└── README.md
```

## Instruções de instalação

É necessário ter o Dart instalado no computador.

Após clonar ou baixar o projeto, abra o terminal na pasta do projeto:

```bash
cd atividade_consumo_api
```

Instale as dependências:

```bash
dart pub get
```

O projeto utiliza o pacote `http` para realizar as requisições HTTP.

## Instruções de execução

Para executar o programa, utilize:

```bash
dart run
```

Após iniciar, o sistema apresentará um menu no terminal:

```text
1 - Consultar Pokémon
2 - Exibir histórico
3 - Limpar histórico
0 - Encerrar
```

## Exemplo de consulta

Para consultar um Pokémon, escolha a opção:

```text
1
```

Depois informe o nome ou número do Pokémon.

Exemplo:

```text
Digite o nome ou número do Pokémon: pikachu
```

O programa apresentará informações como:

* Número;
* Nome;
* Altura;
* Peso;
* Experiência-base;
* Espécie;
* Tipos;
* Habilidades;
* Estatísticas;
* Imagem.

## Funcionalidades implementadas

* Consulta de Pokémon pelo nome;
* Consulta de Pokémon pelo número;
* Requisição HTTP utilizando `GET`;
* Conversão dos dados JSON;
* Modelo `Pokemon`;
* Método `Pokemon.fromJson`;
* Exibição de informações do Pokémon;
* Exibição de habilidades;
* Exibição de estatísticas;
* Exibição da experiência-base;
* Exibição da espécie;
* Histórico das consultas;
* Limpeza do histórico;
* Menu interativo;
* Possibilidade de realizar várias consultas sem reiniciar o programa;
* Tratamento de entrada vazia;
* Tratamento de Pokémon não encontrado;
* Tratamento de falha de conexão;
* Tratamento de resposta inválida;
* Tratamento de erros da API.

## Dificuldades encontradas

Uma das dificuldades encontradas foi compreender como realizar uma requisição HTTP utilizando o pacote `http` no Dart.

Também foi necessário compreender como utilizar `Future`, `async` e `await` para aguardar a resposta da API.

Outra dificuldade foi trabalhar com os dados retornados em formato JSON e transformá-los em objetos da classe `Pokemon` utilizando o método `fromJson`.

Também foi necessário implementar o tratamento de diferentes situações de erro, como Pokémon não encontrado, entrada vazia e falha de conexão.

# Perguntas para reflexão

## 1. O que é uma API?

API significa **Application Programming Interface** ou Interface de Programação de Aplicações.

É uma forma de comunicação entre sistemas. Neste projeto, a aplicação Dart utiliza a API da PokeAPI para solicitar informações sobre Pokémon.

## 2. Qual é a função de uma requisição HTTP?

Uma requisição HTTP permite que uma aplicação se comunique com um servidor para solicitar ou enviar informações.

Neste projeto utilizamos uma requisição HTTP do tipo `GET` para buscar informações sobre um Pokémon.

## 3. O que representa o código HTTP 200?

O código HTTP `200` indica que a requisição foi realizada com sucesso.

No projeto, quando a PokeAPI retorna `200`, os dados recebidos podem ser processados pela aplicação.

## 4. Qual é a diferença entre os códigos 200, 400, 404 e 500?

* **200:** a requisição foi realizada com sucesso.
* **400:** indica que a requisição possui algum problema ou é inválida.
* **404:** indica que o recurso solicitado não foi encontrado.
* **500:** indica um erro interno no servidor.

## 5. Por que utilizamos async e await?

Utilizamos `async` e `await` para trabalhar com operações assíncronas.

A requisição para a API depende da comunicação com um servidor e pode levar algum tempo para retornar. O `await` permite aguardar o resultado da operação assíncrona antes de continuar a execução daquele trecho do programa.

## 6. Qual é a função do método jsonDecode()?

O método `jsonDecode()` é utilizado para converter uma string contendo dados em formato JSON para uma estrutura de dados que pode ser utilizada pelo Dart.

Neste projeto, ele é utilizado para interpretar o conteúdo recebido da PokeAPI.

## 7. Qual é a vantagem de converter o JSON para um objeto Dart?

Converter o JSON para um objeto Dart facilita a organização e utilização dos dados.

No projeto, os dados recebidos da API são transformados em um objeto da classe `Pokemon`, permitindo acessar informações como nome, número, peso, altura, tipos e habilidades de forma organizada.

## 8. Por que devemos tratar exceções ao consumir uma API?

Devemos tratar exceções porque podem ocorrer problemas durante a comunicação com a API.

Por exemplo:

* Falha de conexão;
* Pokémon não encontrado;
* Resposta inválida;
* Erro no servidor;
* Problemas na requisição.

O tratamento de exceções permite apresentar mensagens de erro ao usuário em vez de deixar o programa ser encerrado inesperadamente.
