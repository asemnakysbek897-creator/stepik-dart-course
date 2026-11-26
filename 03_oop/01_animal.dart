// Класс Animal
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

void main() {
  var a = Animal('Краб', 'Себастьян', 10);
  a.display();
  a.weight = 2.3;
  a.isFly = false;
  a.isWalk = true;
  a.isSwim = true;
  print(a);
  a.rename('Крабище');
  a.holiday(3);
  print(a);
  print(a.getAge());
  a.setAge(4);
  print(a);
}
