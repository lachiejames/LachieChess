import 'action.dart';
import 'board.dart';
import 'piece.dart';

class GameManager {
  Board board;
  

  GameManager() {
    board = Board();
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
}
