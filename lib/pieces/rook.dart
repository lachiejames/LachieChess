import '../logic/action.dart';
import '../logic/board.dart';
import '../logic/piece.dart';
import '../logic/tile.dart';

class RookPiece extends Piece {
    final int value = 5;

  RookPiece(Tile tile, String colour, String type) : super(tile, colour, type);

  @override
  List<ChessAction> getPossibleActions(Board board) {
    List<ChessAction> possibleActions = List<ChessAction>();
    for (Tile tile in board.getAvailableTiles()) {
      if ((this.tile.row == tile.row) || (this.tile.col == tile.col)) {
        possibleActions.add(ChessAction(this.tile, tile));
      }
    }
    return possibleActions;
  }
}
