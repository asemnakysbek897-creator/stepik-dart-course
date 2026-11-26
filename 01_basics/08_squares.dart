// Квадраты натуральных чисел, не превосходящие n
import 'dart:io';

int readInt() => int.parse((stdin.readLineSync() ?? '0').trim());

void main() {
  int n = readInt();
  for (int i = 1; i * i <= n; i++) {
    print(i * i);
  }
}
