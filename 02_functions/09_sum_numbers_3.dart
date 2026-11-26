// Сумма 3: именованные параметры k и m
import 'dart:io';

void main() {
  var n = int.parse(stdin.readLineSync() ?? '0');
  print(sum_numbers(n));
  print(sum_numbers(n, k: 2));
  print(sum_numbers(n, m: 3));
  print(sum_numbers(n, k: 2, m: 3));
}

int power(int x, int k) {
  int r = 1;
  for (int i = 0; i < k; i++) {
    r *= x;
  }
  return r;
}

int sum_numbers(int n, {int k = 1, int m = 1}) {
  int sum = 0;
  for (int i = m; i <= n; i += m) {
    sum += power(i, k);
  }
  return sum;
}
