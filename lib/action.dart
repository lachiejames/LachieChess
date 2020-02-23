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

  // @override
  // int hashCode() {
  //   return row*11 + col*107;
  // }

  // bool operator ==(tile) => row == tile.row && col == tile.col;
}
