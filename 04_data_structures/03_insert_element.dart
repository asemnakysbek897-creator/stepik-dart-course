// Добавление элемента в список
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
  var t = readTokens().map(int.parse).toList();
  int n = t[0];
  int m = t[1];
  int k = t[2];
  var list = List.generate(n, (i) => i);
  list.insert(m, k);
  print(list.join(' '));
}
