// Сумма 2: необязательный позиционный параметр k
import 'dart:io';

void main() {
  var n = int.parse(stdin.readLineSync() ?? '0');
  print(sum_numbers(n));
  print(sum_numbers(n, 2));
  print(sum_numbers(n, 3));
}

int power(int x, int k) {
  int r = 1;
  for (int i = 0; i < k; i++) {
    r *= x;
  }
  return r;
}

int sum_numbers(int n, [int k = 1]) {
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += power(i, k);
  }
  return sum;
}
