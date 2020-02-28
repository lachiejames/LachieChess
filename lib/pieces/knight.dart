import '../logic/action.dart';
import '../logic/board.dart';
import '../logic/piece.dart';
import '../logic/tile.dart';

class KnightPiece extends Piece {
    final int value = 3;

    
  KnightPiece(Tile tile, String colour, String type)
      : super(tile, colour, type);

  @override
  List<ChessAction> getPossibleActions(Board board) {
    List<ChessAction> possibleActions = List<ChessAction>();

    for (Tile tile in board.getAvailableTiles()) {
      for (int i = -1; i <= 1; i++) {
        if (i != 0 &&
            ((this.tile.row == tile.row + 2 * 1 &&
                    this.tile.col == tile.col + i) ||
                (this.tile.row == tile.row + i &&
                    this.tile.col == tile.col + 2 * i) ||
                (this.tile.row == tile.row - 2 * 1 &&
                    this.tile.col == tile.col + i) ||
                (this.tile.row == tile.row - i &&
                    this.tile.col == tile.col + 2 * i))) {
          possibleActions.add(ChessAction(this.tile, tile));
        }
      }
    }
    return possibleActions;
  }
}
