import 'package:lachie_chess/tile.dart';

import '../action.dart';
import '../board.dart';
import '../piece.dart';

class RookPiece extends Piece {
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
