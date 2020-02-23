import 'package:lachie_chess/tile.dart';

import '../action.dart';
import '../board.dart';
import '../piece.dart';

class KnightPiece extends Piece {
  KnightPiece(Tile tile, String colour, String type) : super(tile, colour, type);

    @override
  List<ChessAction> getPossibleActions(Board board) {
    return null;
  }
}
