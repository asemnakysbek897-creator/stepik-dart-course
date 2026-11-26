// Большее из 3
import 'dart:io';

int readInt() => int.parse((stdin.readLineSync() ?? '0').trim());

void main() {
  int a = readInt();
  int b = readInt();
  int c = readInt();
  int max = a;
  if (b > max) max = b;
  if (c > max) max = c;
  print(max);
}
