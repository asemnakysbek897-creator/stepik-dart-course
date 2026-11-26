// Кратные k
import 'dart:io';

int readInt() => int.parse((stdin.readLineSync() ?? '0').trim());

void main() {
  int k = readInt();
  int n = readInt();
  for (int i = k; i <= n; i += k) {
    print(i);
  }
}
