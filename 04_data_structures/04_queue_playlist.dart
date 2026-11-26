// Очередь (плейлист)
import 'dart:io';

String readLine() => (stdin.readLineSync() ?? '').trim();

void main() {
  int n = int.parse(readLine());
  var queue = <String>[];
  for (int i = 0; i < n; i++) {
    var parts = readLine().split(' ');
    if (parts[0] == 'push') {
      queue.add(parts[1]);
    } else if (parts[0] == 'pop' && queue.isNotEmpty) {
      print('воспроизводится ${queue.removeAt(0)}');
    }
  }
  print(queue.join(' '));
}
