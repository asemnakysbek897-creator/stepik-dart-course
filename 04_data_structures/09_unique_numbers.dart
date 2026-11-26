// Количество уникальных чисел (Set)
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
  var unique = t.sublist(1, 1 + n).toSet();
  print(unique.length);
}
