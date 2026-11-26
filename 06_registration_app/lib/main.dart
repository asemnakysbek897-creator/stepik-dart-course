import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'login_page.dart';
import 'registration_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ItConfApp());
}

class ItConfApp extends StatelessWidget {
  const ItConfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Регистрация на IT-конференцию',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF4ADE80),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      // Если пользователь уже вошёл — сразу показываем форму, иначе — экран входа
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return snapshot.hasData ? const RegistrationPage() : const LoginPage();
        },
      ),
    );
  }
}
