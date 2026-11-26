// Асинхронность: Future, then, catchError, whenComplete, async/await

Future<String> loadData() {
  return Future(() {
    print('долгие действия');
    return 'данные получены';
  });
}

Future<void> main() async {
  // Через then / catchError / whenComplete
  Future<String> future = Future(() {
    print('долгие действия');
    throw 'Error!';
  });
  await future
      .then((v) => print('Задача выполнилась, получили: $v'))
      .catchError((error) => print('Ошибка: $error'))
      .whenComplete(() => print('Future завершился'));

  // Через async / await
  var result = await loadData();
  print(result);
}
