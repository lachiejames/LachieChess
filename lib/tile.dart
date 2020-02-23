class Tile {
  int row;
  int col;

  bool isOccupied = false;

  Tile(int row, int col) {
    this.row = row;
    this.col = col;
  }

  @override
  String toString() {
    return "Tile - ($row, $col)";
  }

  // @override
  // int hashCode() {
  //   return row*11 + col*107;
  // }

  bool operator ==(tile) => row == tile.row && col == tile.col;
}
