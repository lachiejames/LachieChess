import 'package:flutter/material.dart';
import 'piece.dart';
import 'tile.dart';

class Board {
  List<Tile> tiles;
  List<Piece> pieces;

  Board() {
    tiles = makeTiles();
    pieces = makePieces(tiles);
  }

  List<Tile> makeTiles() {
    List<Tile> tiles = List<Tile>();
    for (var row = 1; row <= 8; row++) {
      for (var col = 1; col <= 8; col++) {
        tiles.add(Tile(row, col));
      }
    }
    return tiles;
  }

  List<Piece> makePieces(List<Tile> tiles) {
    List<Piece> pieces = List<Piece>();
    String pathPrefix = "assets/images/";
    pieces.add(Piece(
        "pawn", getTileAt(1, 1), Image.asset(pathPrefix + "black_bishop.png")));
    return pieces;
  }

  Tile getTileAt(int row, int col) {
    for (Tile tile in tiles) {
      if (tile.row == row && tile.col == col) {
        return tile;
      }
    }
    return null;
  }
}
