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

  @override
  int get hashCode {
    return row * 7 + col * 59;
  }

  bool operator ==(tile) => row == tile.row && col == tile.col;
}
