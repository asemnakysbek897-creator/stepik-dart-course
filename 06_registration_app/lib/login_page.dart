import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Экран входа: авторизация через Firebase Authentication (Email/Password).
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() => _run(() => FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ));

  Future<void> _signUp() => _run(() => FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ));

  /// Выполняет запрос к Firebase и показывает понятную ошибку.
  /// После успешного входа StreamBuilder в main.dart сам откроет форму.
  Future<void> _run(Future<UserCredential> Function() action) async {
    setState(() => _loading = true);
    try {
      await action();
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_errorText(e.code))),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  String _errorText(String code) {
    switch (code) {
      case 'invalid-email':
        return 'Некорректный email';
      case 'weak-password':
        return 'Пароль должен быть не короче 6 символов';
      case 'email-already-in-use':
        return 'Такой пользователь уже существует — нажмите «Войти»';
      case 'invalid-credential':
      case 'user-not-found':
      case 'wrong-password':
        return 'Неверный email или пароль';
      default:
        return 'Ошибка: $code';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.terminal, size: 56),
                const SizedBox(height: 12),
                Text('ВХОД В СИСТЕМУ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall),
                const Text('IT-конференция 2026', textAlign: TextAlign.center),
                const SizedBox(height: 24),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: _loading ? null : _signIn,
                  child: const Text('ВОЙТИ'),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: _loading ? null : _signUp,
                  icon: const Icon(Icons.person_add),
                  label: const Text('СОЗДАТЬ АККАУНТ'),
                ),
                if (_loading) ...[
                  const SizedBox(height: 16),
                  const Center(child: CircularProgressIndicator()),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
