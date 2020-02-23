import '../logic/action.dart';
import '../logic/board.dart';
import '../logic/piece.dart';
import '../logic/tile.dart';

class KingPiece extends Piece {
  KingPiece(Tile tile, String colour, String type) : super(tile, colour, type);

  @override
  List<ChessAction> getPossibleActions(Board board) {
    List<ChessAction> possibleActions = List<ChessAction>();

    for (Tile tile in board.getAvailableTiles()) {
      for (int i = -1; i <= 1; i++) {
        if (i != 0 &&
                (this.tile.row == tile.row && this.tile.col == tile.col + i) ||
            (this.tile.row == tile.row + i && this.tile.col == tile.col) ||
            (this.tile.row == tile.row + i && this.tile.col == tile.col + i) ||
            (this.tile.row == tile.row - i && this.tile.col == tile.col + i)) {
          possibleActions.add(ChessAction(this.tile, tile));
        }
      }
    }
    return possibleActions;
  }
}
