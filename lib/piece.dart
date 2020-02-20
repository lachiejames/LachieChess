import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lachie_chess/tile.dart';

class Piece {
  String name;
  Tile tile;
  Image image;

  Piece(String name, Tile tile, Image image) {
    this.tile = tile;
    this.name = name;
    this.image = image;
  }
}
