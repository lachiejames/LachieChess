import 'package:flutter_test/flutter_test.dart';
import 'package:lachie_chess/action.dart';
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

  // test('getPossibleActions() returns something', () {
  //   for (ChessAction action in board.getPossibleActions()) {
  //     print(action);
  //   }
  // });
}
