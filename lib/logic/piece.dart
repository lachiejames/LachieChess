


import 'package:flutter/material.dart';

import 'action.dart';
import 'board.dart';
import 'tile.dart';

class Piece {
  final String imagePathPrefix = "images/assets/";
  final String imagePathSuffix = "png";

  Tile tile;
  String colour;
  String type;
  Image image;

  Piece(Tile tile, String colour, String type) {
    this.tile = tile;
    this.colour = colour;
    this.type = type;
    image = Image.asset(createImagePath(colour, type));
  }

  String createImagePath(String colour, String type) {
    String imageFileName = "${colour}_$type.$imagePathSuffix";
    return imagePathPrefix + imageFileName;
  }

  List<ChessAction> getPossibleActions(Board board) {
    return null;
  }

  @override
  String toString() {
    return "Piece - $colour $type at $tile";
  }

  @override
  int get hashCode {
    return colour.hashCode - type.hashCode;
  }

  bool operator ==(piece) =>
      piece.tile == tile && piece.type == type && piece.colour == colour;
}
