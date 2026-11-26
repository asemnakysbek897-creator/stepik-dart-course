// Переставить соседние элементы списка
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
  var a = readTokens().map(int.parse).toList();
  if (a.isNotEmpty && a[0] == a.length - 1) {
    a.removeAt(0); // первое число — количество элементов
  }
  for (int i = 0; i + 1 < a.length; i += 2) {
    var t = a[i];
    a[i] = a[i + 1];
    a[i + 1] = t;
  }
  for (var x in a) {
    print(x);
  }
}
