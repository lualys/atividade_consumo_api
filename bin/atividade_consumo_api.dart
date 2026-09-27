import 'dart:io';

import 'package:atividade_consumo_api/services/pokemon_service.dart';

Future<void> main() async {
  final service = PokemonService();

  final List<String> historico = [];

  bool continuar = true;

  print('==============================================');
  print('          CONSULTA DE POKÉMON');
  print('==============================================');

  while (continuar) {
    print('\n----------------------------------------------');
    print('MENU');
    print('----------------------------------------------');
    print('1 - Consultar Pokémon');
    print('2 - Exibir histórico');
    print('3 - Limpar histórico');
    print('0 - Encerrar');
    print('----------------------------------------------');

    stdout.write('Escolha uma opção: ');

    final opcao = stdin.readLineSync()?.trim();

    switch (opcao) {
      case '1':
        await consultarPokemon(service, historico);
        break;

      case '2':
        exibirHistorico(historico);
        break;

      case '3':
        limparHistorico(historico);
        break;

      case '0':
        continuar = false;
        break;

      default:
        print('\nOpção inválida. Digite uma opção do menu.');
    }
  }

  print('\n==============================================');
  print('Programa encerrado.');
  print('==============================================');
}

Future<void> consultarPokemon(
  PokemonService service,
  List<String> historico,
) async {
  stdout.write('\nDigite o nome ou número do Pokémon: ');

  final entrada = stdin.readLineSync();

  if (entrada == null || entrada.trim().isEmpty) {
    print('\n[ERRO] Entrada vazia.');
    print('Digite o nome ou número de um Pokémon.');
    return;
  }

  final consulta = entrada.trim().toLowerCase();

  try {
    print('\nConsultando a API...');

    final pokemon = await service.buscarPokemon(consulta);

    if (!historico.contains(pokemon.nome)) {
      historico.add(pokemon.nome);
    }

    print('\n==============================================');
    print('              RESULTADO');
    print('==============================================');

    print('Número: ${pokemon.id}');
    print('Nome: ${pokemon.nome.toUpperCase()}');
    print('Altura: ${pokemon.altura / 10} m');
    print('Peso: ${pokemon.peso / 10} kg');
    print('Experiência-base: ${pokemon.experienciaBase}');
    print('Espécie: ${pokemon.especie}');
    print('Tipos: ${pokemon.tipos.join(', ')}');

    print('\nHabilidades:');
    for (final habilidade in pokemon.habilidades) {
      print('  - $habilidade');
    }

    print('\nEstatísticas:');
    for (final estatistica in pokemon.estatisticas) {
      print('  - $estatistica');
    }

    print('\nImagem: ${pokemon.imagem}');

    print('==============================================');
  } catch (erro) {
    print('\n----------------------------------------------');
    print('[ERRO] Não foi possível realizar a consulta.');
    print(erro);
    print('----------------------------------------------');
  }
}

void exibirHistorico(List<String> historico) {
  print('\n==============================================');
  print('          HISTÓRICO DE CONSULTAS');
  print('==============================================');

  if (historico.isEmpty) {
    print('Nenhuma consulta foi realizada.');
    return;
  }

  for (int i = 0; i < historico.length; i++) {
    print('${i + 1}. ${historico[i]}');
  }
}

void limparHistorico(List<String> historico) {
  if (historico.isEmpty) {
    print('\nO histórico já está vazio.');
    return;
  }

  historico.clear();

  print('\nHistórico limpo com sucesso.');
}