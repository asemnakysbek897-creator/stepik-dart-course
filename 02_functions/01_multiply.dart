// Произведение трёх чисел
import 'dart:io';

void main() {
  var a = int.parse(stdin.readLineSync() ?? '0');
  var b = int.parse(stdin.readLineSync() ?? '0');
  var c = int.parse(stdin.readLineSync() ?? '0');
  multiply(a, b, c);
}

void multiply(int a, int b, int c) {
  print(a * b * c);
}
