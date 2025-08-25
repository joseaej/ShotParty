class Player {
  final String id;       // identificador único
  final String name;     // nombre del jugador
  final int score;       // puntaje acumulado

  Player({
    required this.id,
    required this.name,
    this.score = 0,
  });

  /// copyWith -> para clonar el objeto con cambios puntuales
  Player copyWith({
    String? id,
    String? name,
    int? score,
  }) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
      score: score ?? this.score,
    );
  }

  /// fromMap -> convertir desde Map (por ejemplo de Firebase o JSON)
  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'] as String,
      name: map['name'] as String,
      score: map['score'] ?? 0,
    );
  }

  /// toMap -> convertir a Map (para enviar a BD o JSON)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'score': score,
    };
  }

  @override
  String toString() {
    return 'Player(id: $id, name: $name, score: $score)';
  }
}
