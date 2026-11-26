// Алгебраический помощник (функция, возвращающая функцию)
import 'dart:io';

void main() {
  var op = stdin.readLineSync();
  var a = int.parse(stdin.readLineSync() ?? '0');
  var b = int.parse(stdin.readLineSync() ?? '0');
  var f = make_f(op);
  if (f is Function)
    print(f(a, b));
  else
    print('is not a Function!');
}

Function make_f(String? op) {
  return (int a, int b) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        if (b == 0) return 'Error';
        return a / b;
      default:
        return 'Error';
    }
  };
}
