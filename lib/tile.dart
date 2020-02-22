class Tile {
  int row;
  int col;

  Tile(int row, int col) {
    this.row = row;
    this.col = col;
  }

  @override
  String toString() {
    return "Tile - ($row, $col)";
  }

  bool operator == (tile) => row == tile.row && col == tile.col;
}
