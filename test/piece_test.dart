import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachie_chess/action.dart';
import 'package:lachie_chess/board.dart';
import 'package:lachie_chess/game_manager.dart';
import 'package:lachie_chess/piece.dart';
import 'package:lachie_chess/tile.dart';

void main() {
  group('misc tests', () {
    test('createImagePath() returns the expected file path', () {
      String colour = "black";
      String type = "rook";
      Piece piece = Piece(Tile(1, 1), colour, type);
      expect(
          piece.createImagePath(colour, type), "images/assets/black_rook.png");
    });

    test('createImagePath() creates a valid image path', () {
      Piece piece = Piece(Tile(1, 1), "black", "rook");
      expect(Image.asset(piece.createImagePath("black", "rook")), isNotNull);
    });
  });

  group("getPossibleActions(), not accounting for isOccupied tiles", () {
    GameManager gameManager = GameManager();
    Board board = gameManager.board;

    setUp(() {
      gameManager = GameManager();
      board = gameManager.board;
      for (Tile tile in board.tiles) {
        tile.isOccupied = false;
      }
    });

    test("White Pawn", () {
      Piece pawn = board.getPieceByName("white", "pawn");
      gameManager.movePiece(pawn, board.getTileAt(4, 4));
      List<ChessAction> actions = pawn.getPossibleActions(board);

      expect(actions.length, 1);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 4))), true);
    });

    test("Black Pawn", () {
      Piece pawn = board.getPieceByName("black", "pawn");
      gameManager.movePiece(pawn, board.getTileAt(4, 4));
      List<ChessAction> actions = pawn.getPossibleActions(board);

      expect(actions.length, 1);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 4))), true);
    });

    test("Rook", () {
      Piece rook = board.getPieceByName("black", "rook");
      gameManager.movePiece(rook, board.getTileAt(4, 4));
      List<ChessAction> actions = rook.getPossibleActions(board);

      expect(actions.length, 14);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(1, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(7, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(8, 4))), true);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 1))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 6))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 7))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 8))), true);
    });

    test("Bishop", () {
      Piece bishop = board.getPieceByName("black", "bishop");
      gameManager.movePiece(bishop, board.getTileAt(4, 4));
      List<ChessAction> actions = bishop.getPossibleActions(board);

      expect(actions.length, 13);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(1, 1))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 6))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(7, 7))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(8, 8))), true);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(7, 1))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 6))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(1, 7))), true);
    });

    test("Knight", () {
      Piece knight = board.getPieceByName("black", "knight");
      gameManager.movePiece(knight, board.getTileAt(4, 4));
      List<ChessAction> actions = knight.getPossibleActions(board);

      expect(actions.length, 8);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 6))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 6))), true);
    });

    test("Queen", () {
      Piece queen = board.getPieceByName("black", "queen");
      gameManager.movePiece(queen, board.getTileAt(4, 4));
      List<ChessAction> actions = queen.getPossibleActions(board);

      expect(actions.length, 27);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(1, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(7, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(8, 4))), true);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 1))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 6))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 7))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 8))), true);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(1, 1))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 6))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(7, 7))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(8, 8))), true);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(7, 1))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 6))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(1, 7))), true);
    });

    test("King", () {
      Piece king = board.getPieceByName("black", "king");
      gameManager.movePiece(king, board.getTileAt(4, 4));
      List<ChessAction> actions = king.getPossibleActions(board);

      expect(actions.length, 8);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 5))), true);
    });
  });

  group("getPossibleActions(), accounting for isOccupied tiles", () {
    GameManager gameManager;
    Board board;
    setUp(() {
      gameManager = GameManager();
      board = gameManager.board;
    });
    test("White Pawn", () {
      Piece pawn = board.getPieceByName("white", "pawn");
      gameManager.movePiece(pawn, board.getTileAt(4, 4));
      List<ChessAction> actions = pawn.getPossibleActions(board);

      expect(actions.length, 1);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 4))), true);
    });

    test("Black Pawn", () {
      Piece pawn = board.getPieceByName("black", "pawn");
      gameManager.movePiece(pawn, board.getTileAt(4, 4));
      List<ChessAction> actions = pawn.getPossibleActions(board);

      expect(actions.length, 1);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 4))), true);
    });

    test("Rook", () {
      Piece rook = board.getPieceByName("black", "rook");
      gameManager.movePiece(rook, board.getTileAt(4, 4));
      List<ChessAction> actions = rook.getPossibleActions(board);

      expect(actions.length, 10);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(1, 4))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 4))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(7, 4))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(8, 4))), false);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 1))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 6))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 7))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 8))), true);
    });

    test("Bishop", () {
      Piece bishop = board.getPieceByName("black", "bishop");
      gameManager.movePiece(bishop, board.getTileAt(4, 4));
      List<ChessAction> actions = bishop.getPossibleActions(board);

      expect(actions.length, 6);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(1, 1))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 2))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 6))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(7, 7))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(8, 8))), false);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(7, 1))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 6))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(1, 7))), false);
    });

    test("Knight", () {
      Piece knight = board.getPieceByName("black", "knight");
      gameManager.movePiece(knight, board.getTileAt(4, 4));
      List<ChessAction> actions = knight.getPossibleActions(board);

      expect(actions.length, 6);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 3))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 5))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 6))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 6))), true);
    });

    test("Queen", () {
      Piece queen = board.getPieceByName("black", "queen");
      gameManager.movePiece(queen, board.getTileAt(4, 4));
      gameManager.board.getTileAt(1, 4).isOccupied = true;
      List<ChessAction> actions = queen.getPossibleActions(board);

      for (ChessAction action in actions) {
        print(action);
      }

      expect(actions.length, 16);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(1, 4))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 4))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(7, 4))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(8, 4))), false);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 1))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 6))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 7))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 8))), true);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(1, 1))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 2))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 6))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(7, 7))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(8, 8))), false);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(7, 1))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(6, 2))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(2, 6))), false);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(1, 7))), false);
    });

    test("King", () {
      Piece king = board.getPieceByName("black", "king");
      gameManager.movePiece(king, board.getTileAt(4, 4));
      List<ChessAction> actions = king.getPossibleActions(board);

      expect(actions.length, 8);

      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 3))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 4))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(3, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(4, 5))), true);
      expect(actions.contains(ChessAction(Tile(4, 4), Tile(5, 5))), true);
    });
  });
}
