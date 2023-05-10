import 'dart:io';
///User choice
int choice({int minimal = 0, int maximal = 2}) {
  stdout.write(">>> ");
  int? ch = int.tryParse(stdin.readLineSync() ?? "");
  while (ch == null || ch < minimal || ch > maximal) {
    clr();
    print("Noto'g'ri buyruq kiritildi!");
    stdout.write(">>> ");
    ch = int.tryParse(stdin.readLineSync() ?? "");
    if (ch == null || ch < minimal || ch > maximal) {
      ch = null;
    }
  }
  return ch;
}

///Console tozalash uchun
void clr() {
  print("\x1B[2J\x1B[0;0H");
}