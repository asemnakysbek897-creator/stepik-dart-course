// Страны и города (Map)
import 'dart:io';

String readLine() => (stdin.readLineSync() ?? '').trim();

void main() {
  int n = int.parse(readLine());
  var country = <String, String>{};
  for (int i = 0; i < n; i++) {
    var parts = readLine().split(RegExp(r'\s+'));
    for (int j = 1; j < parts.length; j++) {
      country[parts[j]] = parts[0];
    }
  }
  int m = int.parse(readLine());
  for (int i = 0; i < m; i++) {
    var city = readLine();
    print(country[city] ?? 'Not found');
  }
}
