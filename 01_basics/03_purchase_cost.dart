// Стоимость покупки
import 'dart:io';

int readInt() => int.parse((stdin.readLineSync() ?? '0').trim());

void main() {
  int a = readInt();
  int b = readInt();
  int n = readInt();
  int total = (a * 100 + b) * n; // всё в копейках
  print('${total ~/ 100} ${total % 100}');
}
