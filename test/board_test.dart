import 'package:flutter_test/flutter_test.dart';
import 'package:lachie_chess/board.dart';
import 'package:lachie_chess/tile.dart';

void main() {
  Board board = Board();
  test('makeTiles() contains 64 tiles', () {
    expect(board.tiles.length, equals(64));
  });

  test('makeTiles() successfully creates all 64 tiles', () {
    for (var row = 1; row <= 8; row++) {
      for (var col = 1; col <= 8; col++) {
        expect(board.tiles.contains(Tile(row, col)), true);
      }
    }
  });

  test('makePieces() contains 32 pieces', () {
    expect(board.pieces.length, equals(32));
  });

  test('makePieces() successfully creates all 32 pieces', () {});

  test('filterAvailableTiles() works as expected', () {
    Board board = Board();
    List<Tile> availableTiles = board.getAvailableTiles();

    for (int row = 1; row <= 8; row++) {
      for (int col = 1; col <= 8; col++) {
        if (row <= 2 || row >= 7) {
          expect(availableTiles.contains(Tile(row, col)), false);
        } else {
          expect(availableTiles.contains(Tile(row, col)), true);
        }
      }
    }
  });
}
