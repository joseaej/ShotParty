import 'package:flutter/material.dart';
import 'package:shotparty/models/player.dart';

class PlayerProvider with ChangeNotifier {
  final List<Player> _players = [];

  List<Player> get players => List.unmodifiable(_players);

  void addPlayer(Player player) {
    _players.add(player);
    notifyListeners();
  }

  void removePlayer(String id) {
    _players.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  void updatePlayer(Player updated) {
    final index = _players.indexWhere((p) => p.id == updated.id);
    if (index != -1) {
      _players[index] = updated;
      notifyListeners();
    }
  }

  Player? getPlayerById(String id) {
    return _players.firstWhere(
      (p) => p.id == id,
      orElse: () => Player(
        id: '',
        name: 'Unknown',
      ),
    );
  }

  void clearPlayers() {
    _players.clear();
    notifyListeners();
  }

  void addScore(String id, int points) {
    final index = _players.indexWhere((p) => p.id == id);
    if (index != -1) {
      final player = _players[index];
      _players[index] = player.copyWith(score: player.score + points);
      notifyListeners();
    }
  }
}
