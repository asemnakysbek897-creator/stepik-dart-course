// Високосный год
import 'dart:io';

int readInt() => int.parse((stdin.readLineSync() ?? '0').trim());

void main() {
  int y = readInt();
  if (y % 400 == 0 || (y % 4 == 0 && y % 100 != 0)) {
    print('Yes');
  } else {
    print('No');
  }
}
