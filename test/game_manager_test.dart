import 'package:flutter_test/flutter_test.dart';
import 'package:lachie_chess/game_manager.dart';

void main() {
  GameManager gameManager = GameManager();

  test('getPossibleActions() returns something', () {
    expect(gameManager.getPossibleActions(), isNotNull);
  });
}
