import '../logic/action.dart';
import '../logic/board.dart';
import '../logic/piece.dart';
import '../logic/tile.dart';

class PawnPiece extends Piece {
    final int value = 1;

  int direction;

  PawnPiece(Tile tile, String colour, String type) : super(tile, colour, type);

  @override
  List<ChessAction> getPossibleActions(Board board) {
    List<ChessAction> possibleActions = List<ChessAction>();

    direction = (colour == "white") ? 1 : -1;

    for (Tile tile in board.getAvailableTiles()) {
      if (this.tile.col == tile.col &&
          this.tile.row == tile.row + 1 * direction) {
        possibleActions.add(ChessAction(this.tile, tile));
      }
    }
    return possibleActions;
  }
}
