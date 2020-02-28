import 'package:lachie_chess/pieces/bishop.dart';
import 'package:lachie_chess/pieces/king.dart';
import 'package:lachie_chess/pieces/knight.dart';
import 'package:lachie_chess/pieces/pawn.dart';
import 'package:lachie_chess/pieces/queen.dart';
import 'package:lachie_chess/pieces/rook.dart';

import 'action.dart';
import 'piece.dart';
import 'tile.dart';

class Board {
  List<Tile> tiles;
  List<Piece> pieces;
  List<ChessAction> actionHistory;

  Board() {
    tiles = makeTiles();
    pieces = makePieces(tiles);
    actionHistory = List<ChessAction>();
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
    if (pieces == null) {
      pieces = List<Piece>();
    }

    addPieceToBoard(RookPiece(getTileAt(1, 1), "black", "rook"));
    addPieceToBoard(KnightPiece(getTileAt(1, 2), "black", "knight"));
    addPieceToBoard(BishopPiece(getTileAt(1, 3), "black", "bishop"));
    addPieceToBoard(QueenPiece(getTileAt(1, 4), "black", "queen"));
    addPieceToBoard(KingPiece(getTileAt(1, 5), "black", "king"));
    addPieceToBoard(BishopPiece(getTileAt(1, 6), "black", "bishop"));
    addPieceToBoard(KnightPiece(getTileAt(1, 7), "black", "knight"));
    addPieceToBoard(RookPiece(getTileAt(1, 8), "black", "rook"));

    for (var i = 1; i <= 8; i++) {
      addPieceToBoard(PawnPiece(getTileAt(2, i), "black", "pawn"));
    }
    for (var i = 1; i <= 8; i++) {
      addPieceToBoard(PawnPiece(getTileAt(7, i), "white", "pawn"));
    }

    addPieceToBoard(RookPiece(getTileAt(8, 1), "white", "rook"));
    addPieceToBoard(KnightPiece(getTileAt(8, 2), "white", "knight"));
    addPieceToBoard(BishopPiece(getTileAt(8, 3), "white", "bishop"));
    addPieceToBoard(QueenPiece(getTileAt(8, 4), "white", "queen"));
    addPieceToBoard(KingPiece(getTileAt(8, 5), "white", "king"));
    addPieceToBoard(BishopPiece(getTileAt(8, 6), "white", "bishop"));
    addPieceToBoard(KnightPiece(getTileAt(8, 7), "white", "knight"));
    addPieceToBoard(RookPiece(getTileAt(8, 8), "white", "rook"));

    return pieces;
  }

  void addPieceToBoard(Piece piece) {
    pieces.add(piece);
    piece.tile.isOccupied = true;
  }

  Tile getTileAt(int row, int col) {
    for (Tile tile in tiles) {
      if (tile.row == row && tile.col == col) {
        return tile;
      }
    }
    return null;
  }

  Piece getPieceByName(String colour, String type) {
    for (Piece piece in pieces) {
      if (piece.colour == colour && piece.type == type) {
        return piece;
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
    piece.tile.isOccupied = false;
    piece.tile = tile;
    piece.tile.isOccupied = true;
  }

  List<Tile> getAvailableTiles() {
    return tiles.where((tile) => !tile.isOccupied).toList();
  }

  void takeAction(ChessAction action) {
    actionHistory.add(action);
    Piece possiblePiece = getPieceAtTile(action.endTile);
    if (possiblePiece != null) {
      pieces.remove(possiblePiece);
    }
    movePiece(getPieceAtTile(action.startTile), action.endTile);
  }

  void undoAction(ChessAction action) {
    // if (actionHistory.last)
    movePiece(getPieceAtTile(action.endTile), action.startTile);
  }

  int calculateValue(String colour) {
    int sum = 0;
    for (Piece piece in pieces) {
      if (piece.colour == colour) {
        sum += piece.value;
      }
    }
    return sum;
  }

  List<ChessAction> getPossibleActions() {
    List<ChessAction> possibleActions = List<ChessAction>();
    for (Piece piece in pieces) {
      for (ChessAction action in piece.getPossibleActions(this)) {
        possibleActions.add(action);
      }
    }
    return possibleActions;
  }
}
