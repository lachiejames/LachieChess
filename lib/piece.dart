import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lachie_chess/tile.dart';

import 'action.dart';
import 'board.dart';

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

  List<Tile> filterAvailableTiles(Board board) {
    return board.tiles.where((t) => !t.isOccupied).toList();
  }

  @override
  String toString() {
    return "Piece - $colour $type at $tile";
  }

  // @override
  // int hashCode() {
  //   return image.hashCode;
  // }

  bool operator ==(piece) =>
      piece.tile == tile && piece.type == type && piece.colour == colour;
}
