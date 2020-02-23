import 'package:flutter_test/flutter_test.dart';
import 'package:lachie_chess/action.dart';
import 'package:lachie_chess/board.dart';
import 'package:lachie_chess/game_manager.dart';
import 'package:lachie_chess/tile.dart';

void main() {
  GameManager gameManager = GameManager();

  test('getPossibleActions() returns something', () {
    for (ChessAction action in gameManager.getPossibleActions()) {
      print(action);
    }
  });
}
