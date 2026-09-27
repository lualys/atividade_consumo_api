import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

class PokemonService {
  static const String _urlBase =
      'https://pokeapi.co/api/v2/pokemon';

  Future<Pokemon> buscarPokemon(String nomeOuId) async {
    final consulta = nomeOuId.trim().toLowerCase();

    final uri = Uri.parse('$_urlBase/$consulta');

    try {
      final resposta = await http.get(uri);

      if (resposta.statusCode == 200) {
        try {
          final Map<String, dynamic> json =
              jsonDecode(resposta.body);

          return Pokemon.fromJson(json);
        } catch (erro) {
          throw Exception(
            'A resposta da API não possui um formato válido.',
          );
        }
      }

      if (resposta.statusCode == 404) {
        throw Exception(
          'Pokémon não encontrado.',
        );
      }

      if (resposta.statusCode >= 500) {
        throw Exception(
          'Erro interno da API. Código: ${resposta.statusCode}',
        );
      }

      if (resposta.statusCode >= 400) {
        throw Exception(
          'Requisição inválida. Código: ${resposta.statusCode}',
        );
      }

      throw Exception(
        'Erro ao acessar a API. Código: ${resposta.statusCode}',
      );
    } on http.ClientException {
      throw Exception(
        'Falha de conexão. Verifique sua internet.',
      );
    }
  }
}