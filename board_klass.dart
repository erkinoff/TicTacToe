class Board {
  Board({required Map<int, String?> board}) : b = board;

  Map<int, String?> b;

  ///Boardni chop qilish uchun
  void printBoard() {
    print(" _______________________      _______________________\n"
        "|       |       |       |    |       |       |       |\n"
        "|   ${b[0] ?? " "}   |   ${b[1] ?? " "}   |   ${b[2] ?? " "}   |    |   1   |   2   |   3   |\n"
        "|_______|_______|_______|    |_______|_______|_______|\n"
        "|       |       |       |    |       |       |       |\n"
        "|   ${b[3] ?? " "}   |   ${b[4] ?? " "}   |   ${b[5] ?? " "}   |    |   4   |   5   |   6   |\n"
        "|_______|_______|_______|    |_______|_______|_______|\n"
        "|       |       |       |    |       |       |       |\n"
        "|   ${b[6] ?? " "}   |   ${b[7] ?? " "}   |   ${b[8] ?? " "}   |    |   7   |   8   |   9   |\n"
        "|_______|_______|_______|    |_______|_______|_______|\n");
  }

  ///G'olibni aniqlash
  String? checkBoard() {
    //Gorizontal tekshirish
    for (var i = 0; i <= 6; i += 3) {
      if (b[i] != null && b[i] == b[i + 1] && b[i + 1] == b[i + 2]) {
        return b[i];
      }
    }

    //Vertikal tekshirish
    for (var i = 0; i <= 2; i++) {
      if (b[i] != null && b[i] == b[i + 3] && b[i + 3] == b[i + 6]) {
        return b[i];
      }
    }

    //Diogonal tekshirish
    if (b[0] != null && b[0] == b[4] && b[4] == b[8]) return b[0];
    if (b[2] != null && b[2] == b[4] && b[4] == b[6]) return b[2];

    //Durranglikka tekshirish
    if (this._isFull()) {
      return "tie";
    } else {
      return null;
    }
  }

  ///Boardni o'zgartirish uchun
  bool playerTurn(int index, String player) {
    if (b[index] != null) return true;
    b[index] = player;
    return false;
  }

  ///To'lganlikka tekshirish
  bool _isFull() {
    for (String? element in b.values) if (element == null) return false;
    return true;
  }

  ///Board tozalash
  void clearBoard() => b = {
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
}
