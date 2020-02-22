import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachie_chess/piece.dart';
import 'package:lachie_chess/tile.dart';

void main() {
  test('createImagePath() returns the expected file path', () {
    String colour = "black";
    String type = "rook";
    Piece piece = Piece(Tile(1, 1), colour, type);
    expect(piece.createImagePath(colour, type), "images/assets/black_rook.png");
  });

  test('createImagePath() creates a valid image path', () {
    Piece piece = Piece(Tile(1, 1), "black", "rook");
    expect(Image.asset(piece.createImagePath("black", "rook")), isNotNull);
  });
}
