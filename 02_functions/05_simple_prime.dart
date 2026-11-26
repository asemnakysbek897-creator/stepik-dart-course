// Простое число
import 'dart:io';

void main() {
  var a = int.parse(stdin.readLineSync() ?? '0');
  var b = int.parse(stdin.readLineSync() ?? '0');
  var c = int.parse(stdin.readLineSync() ?? '0');
  simple(a);
  simple(b);
  simple(c);
}

void simple(int n) {
  if (n < 2) {
    print('NO');
    return;
  }
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) {
      print('NO');
      return;
    }
  }
  print('YES');
}
