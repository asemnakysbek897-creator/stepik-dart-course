# IT Conf Registration

Flutter-приложение: вход через **Firebase Authentication (Email/Password)** и **форма регистрации на IT-конференцию**.
Повторяет приложение, собранное в FlutterFlow (проект «IT Conf Reg»), на обычном Flutter.

## Запуск

```bash
flutter pub get
flutter run -d chrome
```

Если папок `android/`, `ios/` нет — создайте их командой `flutter create .` (код в `lib/` не изменится).
Для запуска на Android/iOS выполните `flutterfire configure --project=it-conf-reg`.

## Как работает

1. **Экран входа** (`lib/login_page.dart`) — поля Email и Пароль, кнопки «Войти» (`signInWithEmailAndPassword`) и «Создать аккаунт» (`createUserWithEmailAndPassword`).
2. После входа `StreamBuilder` в `lib/main.dart` (слушает `authStateChanges()`) открывает **форму регистрации**.
3. **Форма** (`lib/registration_page.dart`) — 7 вопросов, 7 разных виджетов:

| № | Вопрос | Виджет |
|---|--------|--------|
| 1 | ФИО | `TextField` |
| 2 | Email | `TextField` |
| 3 | Город | `DropdownButtonFormField` |
| 4 | Формат участия | `RadioListTile` |
| 5 | Дата посещения | `showDatePicker` |
| 6 | Уровень опыта | `Slider` |
| 7 | Нужен обед | `SwitchListTile` |
| + | Согласие с правилами | `CheckboxListTile` |

4. Кнопка **«Отправить»** показывает `AlertDialog` «Ваша заявка отправлена!» со всеми введёнными данными.
5. Кнопка выхода в AppBar — `FirebaseAuth.instance.signOut()`.
