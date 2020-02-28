import 'package:flutter/material.dart';
import 'package:lachie_chess/ui/chess_ui.dart';

void main() {
  runApp(MaterialApp(
    title: "Lachie's Chess",
    debugShowCheckedModeBanner: false,
    home: ChessUI(),
  ));
  // GameManager gameManager = GameManager();
  // gameManager.startGame();
}
