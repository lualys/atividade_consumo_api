class Pokemon {
  final int id;
  final String nome;
  final int altura;
  final int peso;
  final int experienciaBase;
  final String imagem;
  final List<String> tipos;
  final List<String> habilidades;
  final List<String> estatisticas;
  final String especie;

  Pokemon({
    required this.id,
    required this.nome,
    required this.altura,
    required this.peso,
    required this.experienciaBase,
    required this.imagem,
    required this.tipos,
    required this.habilidades,
    required this.estatisticas,
    required this.especie,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final tipos = (json['types'] as List)
        .map((item) => item['type']['name'].toString())
        .toList();

    final habilidades = (json['abilities'] as List)
        .map((item) => item['ability']['name'].toString())
        .toList();

    final estatisticas = (json['stats'] as List)
        .map((item) {
          final nome = item['stat']['name'].toString();
          final valor = item['base_stat'].toString();

          return '$nome: $valor';
        })
        .toList();

    return Pokemon(
      id: json['id'],
      nome: json['name'],
      altura: json['height'],
      peso: json['weight'],
      experienciaBase: json['base_experience'] ?? 0,
      imagem: json['sprites']['front_default'] ??
          'Imagem indisponível',
      tipos: tipos,
      habilidades: habilidades,
      estatisticas: estatisticas,
      especie: json['species']['name'] ?? 'Desconhecida',
    );
  }
}