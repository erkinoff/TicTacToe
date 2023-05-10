import 'game_klass.dart';

void main(List<String> args) {
  Game game;
  while (true) {
    game = Game();
    game.start();
    int end = game.endGame();
    if (end == 0) {
      break;
    }
  }
}
