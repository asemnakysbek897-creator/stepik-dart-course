// Конфигурация Firebase-проекта it-conf-reg (веб-приложение «IT Conf Reg Web»).
// Это публичные идентификаторы проекта, они не являются секретом.
// Для Android/iOS выполните: dart pub global activate flutterfire_cli && flutterfire configure --project=it-conf-reg
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    throw UnsupportedError(
      'Для этой платформы выполните `flutterfire configure --project=it-conf-reg` '
      'или запустите приложение в браузере: flutter run -d chrome',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBV5c2w_gEANqobDPWhtuJggLVPYc3PfZ0',
    appId: '1:331648058940:web:3b9afd028c1861a4aa6539',
    messagingSenderId: '331648058940',
    projectId: 'it-conf-reg',
    authDomain: 'it-conf-reg.firebaseapp.com',
    storageBucket: 'it-conf-reg.firebasestorage.app',
  );
}
