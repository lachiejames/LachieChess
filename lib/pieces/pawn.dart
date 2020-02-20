import 'package:flutter/src/widgets/image.dart';

import 'package:lachie_chess/tile.dart';

import '../piece.dart';

class Pawn extends Piece {
  Pawn(String name, Tile tile, Image image) : super(name, tile, image);
}
