import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lachie_chess/tile.dart';

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
