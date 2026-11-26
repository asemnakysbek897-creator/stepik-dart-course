// Сколько элементов, равных максимуму
import 'dart:io';

int readInt() => int.parse((stdin.readLineSync() ?? '0').trim());

void main() {
  int max = 0;
  int count = 0;
  while (true) {
    int x = readInt();
    if (x == 0) break;
    if (x > max) {
      max = x;
      count = 1;
    } else if (x == max) {
      count++;
    }
  }
  print(count);
}
