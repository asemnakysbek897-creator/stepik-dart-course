// Факториал
import 'dart:io';

void main() {
  var n = int.parse(stdin.readLineSync() ?? '0');
  print(factorial(n));
}

int factorial(int n) {
  int result = 1;
  for (int i = 2; i <= n; i++) {
    result *= i;
  }
  return result;
}
