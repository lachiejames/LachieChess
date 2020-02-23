import 'action.dart';
import 'piece.dart';
import 'pieces/bishop.dart';
import 'pieces/king.dart';
import 'pieces/knight.dart';
import 'pieces/pawn.dart';
import 'pieces/queen.dart';
import 'pieces/rook.dart';
import 'tile.dart';

class Board {
  List<Tile> tiles;
  List<Piece> pieces;

  Board() {
    tiles = makeTiles();
    pieces = makePieces(tiles);
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

    pieces.add(RookPiece(getTileAt(1, 1), "black", "rook"));
    pieces.add(KnightPiece(getTileAt(1, 2), "black", "knight"));
    pieces.add(BishopPiece(getTileAt(1, 3), "black", "bishop"));
    pieces.add(QueenPiece(getTileAt(1, 4), "black", "queen"));
    pieces.add(KingPiece(getTileAt(1, 5), "black", "king"));
    pieces.add(BishopPiece(getTileAt(1, 6), "black", "bishop"));
    pieces.add(KnightPiece(getTileAt(1, 7), "black", "knight"));
    pieces.add(RookPiece(getTileAt(1, 8), "black", "rook"));

    for (var i = 1; i <= 8; i++) {
      pieces.add(PawnPiece(getTileAt(2, i), "black", "pawn"));
    }
    for (var i = 1; i <= 8; i++) {
      pieces.add(PawnPiece(getTileAt(7, i), "white", "pawn"));
    }

    pieces.add(RookPiece(getTileAt(8, 1), "white", "rook"));
    pieces.add(KnightPiece(getTileAt(8, 2), "white", "knight"));
    pieces.add(BishopPiece(getTileAt(8, 3), "white", "bishop"));
    pieces.add(QueenPiece(getTileAt(8, 4), "white", "queen"));
    pieces.add(KingPiece(getTileAt(8, 5), "white", "king"));
    pieces.add(BishopPiece(getTileAt(8, 6), "white", "bishop"));
    pieces.add(KnightPiece(getTileAt(8, 7), "white", "knight"));
    pieces.add(RookPiece(getTileAt(8, 8), "white", "rook"));

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

  Piece getPieceAtTile(Tile tile) {
    for (Piece piece in pieces) {
      if (piece.tile == tile) {
        return piece;
      }
    }
    return null;
  }

  void movePiece(Piece piece, Tile tile) {
    piece.tile = tile;
  }

}
