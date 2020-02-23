import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lachie_chess/action.dart';
import 'package:lachie_chess/board.dart';
import 'package:lachie_chess/game_manager.dart';
import 'package:lachie_chess/piece.dart';
import 'package:lachie_chess/tile.dart';

void main() {
  test('createImagePath() returns the expected file path', () {
    String colour = "black";
    String type = "rook";
    Piece piece = Piece(Tile(1, 1), colour, type);
    expect(piece.createImagePath(colour, type), "images/assets/black_rook.png");
  });

  test('createImagePath() creates a valid image path', () {
    Piece piece = Piece(Tile(1, 1), "black", "rook");
    expect(Image.asset(piece.createImagePath("black", "rook")), isNotNull);
  });

  group("testing each piece type's getPossibleActions() when on Tile(4,4)", () {
    GameManager gameManager = GameManager();
    Board board = gameManager.board;

    test("Pawn", () {
      Piece pawn = board.getPieceByName("black", "pawn");
      pawn.tile = board.getTileAt(4, 4);
      expect(pawn.tile, Tile(4, 4));
      List<ChessAction> possibleActions = pawn.getPossibleActions(board);
      expect(possibleActions.contains(ChessAction(Tile(4, 4), Tile(5, 4))), true);
    });
  });
}
