// Вкусный бутерброд (параметр по умолчанию)
import 'dart:io';

void main() {
  var saus = stdin.readLineSync();
  make_sandwich(saus);
  print('');
  make_sandwich(saus, false);
}

void make_sandwich(String? type_sausage, [bool with_butter = true]) {
  print('Вы берёте один прекрасный кусочек хлеба');
  if (with_butter) {
    print('намазываете на него ровным слоем сливочное масло');
  }
  print('кладёте два кусочка колбасы марки $type_sausage');
  print('Приятного аппетита!');
}
