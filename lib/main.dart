import 'package:flutter/material.dart';
import 'package:lachie_chess/game_manager.dart';

import 'chess.dart';

void main() {
  runApp(Chess());
  GameManager gameManager = GameManager();
  gameManager.startGame();
}
