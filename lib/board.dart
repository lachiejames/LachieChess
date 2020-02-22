import 'piece.dart';
import 'tile.dart';

class Board {
  List<Tile> tiles;
  List<Piece> pieces;

  Board() {
    tiles = makeTiles();
    pieces = makePieces(tiles);
    for (Piece piece in pieces) {
      print(piece.toString());
    }
  }

  List<Tile> makeTiles() {
    List<Tile> tiles = List<Tile>();
    for (var row = 1; row <= 8; row++) {
      for (var col = 1; col <= 8; col++) {
        tiles.add(Tile(row, col));
      }
    }
    return tiles;
  }

  List<Piece> makePieces(List<Tile> tiles) {
    List<Piece> pieces = List<Piece>();

    pieces.add(Piece(getTileAt(1, 1), "black", "rook"));
    pieces.add(Piece(getTileAt(1, 2), "black", "knight"));
    pieces.add(Piece(getTileAt(1, 3), "black", "bishop"));
    pieces.add(Piece(getTileAt(1, 4), "black", "queen"));
    pieces.add(Piece(getTileAt(1, 5), "black", "king"));
    pieces.add(Piece(getTileAt(1, 6), "black", "bishop"));
    pieces.add(Piece(getTileAt(1, 7), "black", "knight"));
    pieces.add(Piece(getTileAt(1, 8), "black", "rook"));

    pieces.add(Piece(getTileAt(2, 1), "black", "pawn"));
    pieces.add(Piece(getTileAt(2, 2), "black", "pawn"));
    pieces.add(Piece(getTileAt(2, 3), "black", "pawn"));
    pieces.add(Piece(getTileAt(2, 4), "black", "pawn"));
    pieces.add(Piece(getTileAt(2, 5), "black", "pawn"));
    pieces.add(Piece(getTileAt(2, 6), "black", "pawn"));
    pieces.add(Piece(getTileAt(2, 7), "black", "pawn"));
    pieces.add(Piece(getTileAt(2, 8), "black", "pawn"));

    pieces.add(Piece(getTileAt(7, 1), "white", "pawn"));
    pieces.add(Piece(getTileAt(7, 2), "white", "pawn"));
    pieces.add(Piece(getTileAt(7, 3), "white", "pawn"));
    pieces.add(Piece(getTileAt(7, 4), "white", "pawn"));
    pieces.add(Piece(getTileAt(7, 5), "white", "pawn"));
    pieces.add(Piece(getTileAt(7, 6), "white", "pawn"));
    pieces.add(Piece(getTileAt(7, 7), "white", "pawn"));
    pieces.add(Piece(getTileAt(7, 8), "white", "pawn"));

    pieces.add(Piece(getTileAt(8, 1), "white", "rook"));
    pieces.add(Piece(getTileAt(8, 2), "white", "knight"));
    pieces.add(Piece(getTileAt(8, 3), "white", "bishop"));
    pieces.add(Piece(getTileAt(8, 4), "white", "queen"));
    pieces.add(Piece(getTileAt(8, 5), "white", "king"));
    pieces.add(Piece(getTileAt(8, 6), "white", "bishop"));
    pieces.add(Piece(getTileAt(8, 7), "white", "knight"));
    pieces.add(Piece(getTileAt(8, 8), "white", "rook"));

    return pieces;
  }

  Tile getTileAt(int row, int col) {
    for (Tile tile in tiles) {
      if (tile.row == row && tile.col == col) {
        return tile;
      }
    }
    return null;
  }
}
