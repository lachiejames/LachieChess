import 'package:lachie_chess/tile.dart';

import '../action.dart';
import '../board.dart';
import '../piece.dart';

class BishopPiece extends Piece {
  BishopPiece(Tile tile, String colour, String type)
      : super(tile, colour, type);

  @override
  List<ChessAction> getPossibleActions(Board board) {
    List<ChessAction> possibleActions = List<ChessAction>();
    for (Tile tile in super.filterAvailableTiles(board)) {
      for (int i = -8; i <= 8; i++) {
        if (i != 0 && (this.tile.row == tile.row + i && this.tile.col == tile.col + i) 
        || (this.tile.row == tile.row - i && this.tile.col == tile.col + i)) {
          possibleActions.add(ChessAction(this.tile, tile));
        }
      }
    }
    return possibleActions;
  }
}
