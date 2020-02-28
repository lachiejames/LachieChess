import '../logic/action.dart';
import '../logic/board.dart';
import '../logic/piece.dart';
import '../logic/tile.dart';

class BishopPiece extends Piece {
  final int value = 3;

  BishopPiece(Tile tile, String colour, String type)
      : super(tile, colour, type);

  @override
  List<ChessAction> getPossibleActions(Board board) {
    List<ChessAction> possibleActions = List<ChessAction>();
    for (Tile tile in board.getAvailableTiles()) {
      for (int i = -8; i <= 8; i++) {
        if (i != 0 &&
                (this.tile.row == tile.row + i &&
                    this.tile.col == tile.col + i) ||
            (this.tile.row == tile.row - i && this.tile.col == tile.col + i)) {
          possibleActions.add(ChessAction(this.tile, tile));
        }
      }
    }
    return possibleActions;
  }
}
