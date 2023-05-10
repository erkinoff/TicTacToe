import 'dart:io';
import 'dart:math';
import 'board_klass.dart';
import 'variables.dart';
import 'functions.dart';

Map<int, String?> board = {
  0: null,
  1: null,
  2: null,
  3: null,
  4: null,
  5: null,
  6: null,
  7: null,
  8: null,
};

Board gameBoard = new Board(board: board);

///O'yin boshlash uchun
class Game {

  ///Start buyrug'i
  void start() {
    clr(); //tozalash
    print("TicTacToe o'yiniga xush kelibsiz!");
    print(menyu);
    int userChoice = choice();
    switch (userChoice) {
      case 0:
        return;
      case 1:
        this._singlePlayer(gameBoard);
        break;
      case 2:
        this._multiPlayer(gameBoard);
        break;
    }
  }

  ///Singleplayer mode
  void _singlePlayer(Board gameBoard) {
    String player;
    String bot;
    clr(); //tozalash
    print("Bir kishilik o'yinga Xush kelibsiz!");
    print(playerChoice);
    int intChoice = choice();
    if (intChoice == 0) {
      return;
    } else {
      player = intChoice == 1 ? "X" : "O";
      bot = player == "X" ? "O" : "X";
      String? winner;
      loop:
      while (winner == null) {
        clr();
        gameBoard.printBoard();
        print(choiceIndex);
        int index = choice(maximal: 9);
        if (index == 0) break;

        while (gameBoard.playerTurn(index - 1, player)) {
          print("Berilgan indeksdagi joy band!");
          sleep(Duration(seconds: 2));
          continue loop;
        }
        winner = gameBoard.checkBoard();
        if (winner != null) break;

        int botIndex = Random().nextInt(9);
        while (gameBoard.playerTurn(botIndex, bot)) {
          botIndex = Random().nextInt(9);
        }
        winner = gameBoard.checkBoard();
      }
      
      clr();
      gameBoard.printBoard();
      if (winner == "tie")
        print("Durrang!\n");
      else
        print("$winner yutdi!\n");
    }
    gameBoard.clearBoard();
  }

  ///Multiplayer mode
  void _multiPlayer(Board gameBoard) {
    String player1;
    String player2;
    clr(); //tozalash
    print("Ikki kishilik o'yinga Xush kelibsiz!");
    print(playerChoice);
    int intChoice = choice();
    if (intChoice == 0) {
      return;
    } else {
      player1 = intChoice == 1 ? "X" : "O";
      player2 = player1 == "X" ? "O" : "X";
      String? winner;

      loop:
      while (winner == null) {
        clr();
        gameBoard.printBoard();
        print(choiceIndex + "($player1 navbati)");
        int index = choice(maximal: 9);
        if (index == 0) break;
        while (gameBoard.playerTurn(index - 1, player1)) {
          print("Berilgan indeksdagi joy band!");
          sleep(Duration(seconds: 2));
          continue loop;
        }
        winner = gameBoard.checkBoard();
        if (winner != null) break loop;

        play2:
        while (true) {
          clr();
          gameBoard.printBoard();
          print(choiceIndex + "($player2 navbati)");
          index = choice(maximal: 9);
          if (index == 0) break loop;
          while (gameBoard.playerTurn(index-1, player2)) {
            print("Berilgan indeksdagi joy band!");
            sleep(Duration(seconds: 2));
            continue play2;
          }
          winner = gameBoard.checkBoard();
          if (winner != null) break loop;
          break;
        }
        winner = gameBoard.checkBoard();
      }

      clr();
      gameBoard.printBoard();
      if (winner == "tie")
        print("Durrang!\n");
      else
        print("$winner yutdi!\n");
    }
    gameBoard.clearBoard();
  }

  ///O'yin tugatish
  int endGame() {
    print(endNote);
    return choice(maximal: 1);
  }
}
