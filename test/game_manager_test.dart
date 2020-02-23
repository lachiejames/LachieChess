import 'package:flutter_test/flutter_test.dart';
import 'package:lachie_chess/action.dart';
import 'package:lachie_chess/game_manager.dart';
import 'package:lachie_chess/piece.dart';

void main() {
  GameManager gameManager = GameManager();

  test('getPossibleActions() returns something', () {
    for (Piece piece in gameManager.board.pieces) {
      print(piece);
      for (ChessAction action in piece.getPossibleActions(gameManager.board)) {
        // print(action);
      }
    }
  });
}
