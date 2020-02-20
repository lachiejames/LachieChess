import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lachie_chess/tile.dart';

class Piece {
  Tile tile;
  Image image;

  Piece(Tile tile, Image image) {
    this.tile = tile;
    this.image = image;
  }
}
