import 'piece.dart';
import 'tile.dart';

class Board {
  List<Tile> tiles;
  List<Piece> pieces;

  Board() {
    tiles = makeTiles();
  }

  List<Tile> makeTiles() {
    List<Tile> tiles;
    for (int row = 1; row <= 8; row++) {
      for (int col = 1; col <= 8; col++) {
        tiles.add(Tile(row, row));
      }
    }
    return tiles;
  }
}
