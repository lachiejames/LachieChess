import 'package:flutter_test/flutter_test.dart';
import 'package:lachie_chess/action.dart';
import 'package:lachie_chess/tile.dart';

void main() {
  test('toString() prints expected string', () {
    ChessAction action = ChessAction(Tile(1, 1), Tile(3, 4));
    expect(action.toString(), "Action - From Tile(1, 1) to Tile(3, 4)");
  });

  test('hashcode is expected value', () {
    ChessAction action = ChessAction(Tile(1, 1), Tile(3, 4));
    expect(action.hashCode, 1 * 7 + 1 * 59 + 3 * 479 + 4 * 3833);
  });
}
