// Словарь синонимов
import 'dart:io';

String readLine() => (stdin.readLineSync() ?? '').trim();

void main() {
  int n = int.parse(readLine());
  var dict = <String, String>{};
  for (int i = 0; i < n; i++) {
    var a = readLine();
    var b = readLine();
    dict[a] = b;
    dict[b] = a;
  }
  var word = readLine();
  print(dict[word] ?? 'Error');
}
