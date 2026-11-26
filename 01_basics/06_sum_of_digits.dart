// Сумма цифр трёхзначного числа
import 'dart:io';

int readInt() => int.parse((stdin.readLineSync() ?? '0').trim());

void main() {
  int n = readInt().abs();
  int sum = 0;
  while (n > 0) {
    sum += n % 10;
    n ~/= 10;
  }
  print(sum);
}
