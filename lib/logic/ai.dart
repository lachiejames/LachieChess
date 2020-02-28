import 'dart:math';

import 'action.dart';
import 'board.dart';

class AI {
  final int minimaxCutoffDepth = 2;
  final int minValue = -10000;
  final int maxValue = 10000;

  ChessAction bestAction;
  ChessAction winningAction;

  ChessAction getBestAction(Board board) {
    minimax(board, 0, true, minValue, maxValue);
    try {
    return bestAction;
    } catch(e) {
      return null;
    }
  }

  int minimax(Board board, int depth, bool maximizing, int alpha, int beta) {
    if (depth >= minimaxCutoffDepth) {
      return board.calculateValue("black");
    }

    if (maximizing) {
      int value = minValue;
      for (ChessAction action in board.getPossibleActions()) {
        int prevValue = value;
        board.takeAction(action);
        value = max(value, minimax(board, depth + 1, false, alpha, beta));
        board.undoAction(action);
        int newValue = value;
        if (depth == 0 && newValue > prevValue) {
          bestAction = action;
        }
        alpha = max(alpha, value);
        if (alpha >= beta) {
          break;
        }
      }
      return value;
    } else {
      int value = maxValue;
      for (ChessAction action in board.getPossibleActions()) {
        board.takeAction(action);
        value = min(value, minimax(board, depth + 1, true, alpha, beta));
        board.undoAction(action);
        beta = min(beta, value);
        if (alpha >= beta) {
          break;
        }
      }
      return value;
    }
  }
}
