import 'package:lachie_chess/logic/action.dart';
import 'package:lachie_chess/logic/ai.dart';
import 'package:lachie_chess/logic/board.dart';

import '../logic/piece.dart';
import '../logic/tile.dart';

class GameManager {
  Board board;
  AI ai;

  GameManager() {
    board = Board();
    ai = AI();
  }

  List<ChessAction> getPossibleActions() {
    List<ChessAction> possibleActions = List<ChessAction>();
    for (Piece piece in board.pieces) {
      for (ChessAction action in piece.getPossibleActions(board)) {
        possibleActions.add(action);
      }
    }
    return possibleActions;
  }

  void startGame() {}

  void movePiece(Piece piece, Tile newTile) {
    piece.tile.isOccupied = false;
    newTile.isOccupied = true;
    piece.tile = newTile;
  }
}
