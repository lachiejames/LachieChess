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
    for (Tile t in board.tiles) {
      if (t.row == tile.col) {
        
      }
    }
    return possibleActions;
  }
}
