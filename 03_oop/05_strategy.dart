// Стратегия: солдаты и герои
import 'dart:math';

class Unit {
  static int _counter = 0;
  final int id;
  final int team;

  Unit(this.team) : id = ++_counter;
}

class Hero extends Unit {
  int level = 1;

  Hero(int team) : super(team);

  void levelUp() {
    level++;
  }
}

class Soldier extends Unit {
  Hero? leader;

  Soldier(int team) : super(team);

  void followHero(Hero hero) {
    leader = hero;
  }
}

void main() {
  var random = Random();
  var hero1 = Hero(1);
  var hero2 = Hero(2);

  var team1 = <Soldier>[];
  var team2 = <Soldier>[];

  for (int i = 0; i < 20; i++) {
    int team = random.nextInt(2) + 1;
    var soldier = Soldier(team);
    if (team == 1) {
      team1.add(soldier);
    } else {
      team2.add(soldier);
    }
  }

  print('Солдат в команде 1: ${team1.length}');
  print('Солдат в команде 2: ${team2.length}');

  if (team1.length > team2.length) {
    hero1.levelUp();
  } else if (team2.length > team1.length) {
    hero2.levelUp();
  }
  print('Уровень героя 1: ${hero1.level}, уровень героя 2: ${hero2.level}');

  if (team1.isNotEmpty) {
    var soldier = team1.first;
    soldier.followHero(hero1);
    print('Солдат №${soldier.id} идёт за героем №${hero1.id}');
  }
}
