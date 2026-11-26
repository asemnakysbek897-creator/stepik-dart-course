// Симметричная ли матрица?
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
  bool sym = true;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (t[1 + i * n + j] != t[1 + j * n + i]) {
        sym = false;
      }
    }
  }
  print(sym ? 'YES' : 'NO');
}
