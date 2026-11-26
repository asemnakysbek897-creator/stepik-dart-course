// Найди змею (python / Python)
import 'dart:io';

int readInt() => int.parse((stdin.readLineSync() ?? '0').trim());

void main() {
  int n = readInt();
  bool found = false;
  for (int i = 0; i < n; i++) {
    String s = stdin.readLineSync() ?? '';
    if (s.contains('python') || s.contains('Python')) {
      found = true;
    }
  }
  print(found ? 'Yes' : 'No');
}
