import 'package:flutter/material.dart';

class TileUI {
  Image image;
  int row;
  int col;

  TileUI(int row, int col) {
    this.row = row;
    this.col = col;
    image = Image.asset("assets/images/black_pawn.png");
  }
}


