// Сумма 1: 1 + 2 + ... + n
import 'dart:io';

void main() {
  var n = int.parse(stdin.readLineSync() ?? '0');
  print(sum_numbers(n));
}

int sum_numbers(int n) {
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += i;
  }
  return sum;
}
