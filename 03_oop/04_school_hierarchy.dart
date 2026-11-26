// Иерархия в школе.
// В Dart нет множественного наследования классов, поэтому
// «Менеджерский состав» сделан миксином: Завуч — это Учитель + Management.

class Human {}

class Employee extends Human {}

class Student extends Human {}

class Parrent extends Human {}

class Visitor extends Human {}

class JuniorSchoolStudent extends Student {}

class MiddleSchoolStudent extends Student {}

class HighSchoolStudent extends Student {}

mixin Management on Employee {}

class Teacher extends Employee {}

class Cleaner extends Employee {}

class Sequrity extends Employee {}

class Director extends Employee with Management {}

class HeadTeacher extends Teacher with Management {}

void main() {
  var headTeacher = HeadTeacher();
  print(headTeacher is Teacher);    // true
  print(headTeacher is Management); // true
  print(headTeacher is Employee);   // true
  print(headTeacher is Human);      // true
}
