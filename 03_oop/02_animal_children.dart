// Наследники Animal: Bird, Fish, Insect
class Animal {
  String type;
  String name;
  int age;
  double weight = 0;
  bool isFly = false;
  bool isWalk = true;
  bool isSwim = false;

  Animal(this.type, this.name, this.age);

  String _yesNo(bool value) => value ? 'Да' : 'Нет';

  void display() {
    print(toString());
  }

  @override
  String toString() {
    return 'Тип: $type, Имя: $name, Возраст: $age, Вес: ${weight.toStringAsFixed(1)}, '
        'Умеет летать: ${_yesNo(isFly)}, Умеет ходить: ${_yesNo(isWalk)}, '
        'Умеет плавать: ${_yesNo(isSwim)}.';
  }

  void rename(String newName) {
    name = newName;
  }

  void holiday(int k) {
    weight += 0.1 * k;
  }

  int getAge() => age;

  void setAge(int newAge) {
    age = newAge;
  }
}

class Bird extends Animal {
  String area = 'Неизвестно';
  bool winterFly = false;

  Bird(String name, int age) : super('Bird', name, age) {
    isFly = true;
  }

  void chirik_chirik() {
    print('Chirik-Chirik');
  }
}

class Fish extends Animal {
  String squama = 'Обычная';
  bool upStreamSwim = true;

  Fish(String name, int age) : super('Fish', name, age) {
    isSwim = true;
    isWalk = false;
  }

  void bul_bul() {
    print('Bul-bul');
  }
}

class Insect extends Animal {
  int wingCount = 0;
  bool likeJesus = false;

  Insect(String name, int age) : super('Insect', name, age) {
    isWalk = true;
  }

  void ggggg() {
    print('Ggggg');
  }
}

void main() {
  var b = Bird('Ptica', 4);
  print(b);
  b.area = 'Vezde';
  b.winterFly = true;
  b.chirik_chirik();
  b.rename('Golub');
  b.display();

  var f = Fish('Kit', 56);
  f.squama = 'Norm';
  f.upStreamSwim = false;
  f.bul_bul();
  f.rename('Forel');
  f.display();

  var i = Insect('Gena', 1);
  i.wingCount = 4;
  i.ggggg();
  i.rename('NeGena');
  i.display();
}
