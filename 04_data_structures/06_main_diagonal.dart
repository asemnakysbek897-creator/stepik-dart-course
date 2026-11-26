// Главная диагональ
import 'dart:io';

List<String> readTokens() {
  var tokens = <String>[];
  String? line;
  while ((line = stdin.readLineSync()) != null) {
    tokens.addAll(line!.trim().split(RegExp(r'\s+')).where((s) => s.isNotEmpty));
  }
  return tokens;
}

void main() {
  int n = int.parse(readTokens()[0]);
  for (int i = 0; i < n; i++) {
    var row = <int>[];
    for (int j = 0; j < n; j++) {
      if (i == j) {
        row.add(1);
      } else if (i > j) {
        row.add(2);
      } else {
        row.add(0);
      }
    }
    print(row.join(' '));
  }
}
