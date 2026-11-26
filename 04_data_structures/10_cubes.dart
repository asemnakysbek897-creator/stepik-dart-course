// Кубики (операции над множествами)
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
  var anya = t.sublist(2, 2 + n).toSet();
  var borya = t.sublist(2 + n, 2 + n + m).toSet();
  var both = anya.intersection(borya).toList()..sort();
  var onlyA = anya.difference(borya).toList()..sort();
  var onlyB = borya.difference(anya).toList()..sort();
  for (var s in [both, onlyA, onlyB]) {
    print(s.length);
    print(s.join(' '));
  }
}
