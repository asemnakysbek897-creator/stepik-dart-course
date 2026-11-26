// Площадь поверхности параллелепипеда
import 'dart:io';

void area(int a, int b, int c) {
  print(2 * (a * b + b * c + a * c));
}

void main() {
  var a = int.parse(stdin.readLineSync() ?? '0');
  var b = int.parse(stdin.readLineSync() ?? '0');
  var c = int.parse(stdin.readLineSync() ?? '0');
  area(a, b, c);
}
