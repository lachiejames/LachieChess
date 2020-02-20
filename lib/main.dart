import 'package:flutter/material.dart';

import 'board.dart';
import 'chess.dart';
import 'tile.dart';

void main() {
  runApp(Chess());
  Board board = Board();
  for (Tile tile in board.tiles) {
    myPrint(tile.toString());
  }
}

void myPrint(String message) {
  print("xxx:   " + message);
}
