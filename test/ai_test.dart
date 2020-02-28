import 'package:flutter_test/flutter_test.dart';
import 'package:lachie_chess/logic/action.dart';
import 'package:lachie_chess/logic/ai.dart';
import 'package:lachie_chess/logic/board.dart';
import 'package:lachie_chess/logic/tile.dart';
import 'package:lachie_chess/managers/game_manager.dart';

void main() {
  GameManager gameManager;
  AI ai;
  Board board;

  setUp(() {
    gameManager = GameManager();
    ai = gameManager.ai;
    board = gameManager.board;
  });

  test('minimax() returns a value', () {
    expect(ai.minimax(board, 0, true, ai.minValue, ai.maxValue), isNotNull);
  });

  test('getBestAction() returns a value', () {
    expect(ai.getBestAction(board), isNotNull);
  });

  test('minimax() returns the expected value', () {
    expect(ai.minimax(board, 0, true, ai.minValue, ai.maxValue), 1039);
  });

  test('getBestAction() returns the expected action', () {
    expect(ai.getBestAction(board), ChessAction(Tile(1,1), Tile(3,1)));
  });
}
