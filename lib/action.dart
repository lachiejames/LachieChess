import 'tile.dart';

class ChessAction {
  Tile startTile;
  Tile endTile;

  ChessAction(Tile startTile, Tile endTile) {
    this.startTile = startTile;
    this.endTile = endTile;
  }

  @override
  String toString() {
    return "Action - From Tile(${startTile.row}, ${startTile.col}) to Tile(${endTile.row}, ${endTile.col})";
  }

  @override
  int hashCode() {
    return startTile.row * 7 +
        startTile.col * 59 +
        endTile.row * 479 +
        endTile.col * 3833;
  }

  bool operator ==(action) =>
      action.startTile == startTile && action.endTile == endTile;
}
