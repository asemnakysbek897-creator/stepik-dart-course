// Кегельбан
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
  int k = t[1];
  var pins = List.filled(n, 'I');
  for (int i = 0; i < k; i++) {
    int a = t[2 + 2 * i];
    int b = t[3 + 2 * i];
    for (int j = a; j <= b; j++) {
      pins[j - 1] = '.';
    }
  }
  print(pins.join());
}
