import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Форма регистрации на IT-конференцию.
/// 7 вопросов, 7 разных виджетов: TextField, DropdownButtonFormField,
/// RadioListTile, DatePicker (showDatePicker), Slider, SwitchListTile, CheckboxListTile.
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

enum Format { online, offline }

class _RegistrationPageState extends State<RegistrationPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  String _city = 'Алматы';
  Format _format = Format.online;
  DateTime? _date;
  double _experience = 5;
  bool _needLunch = false;
  bool _agree = false;

  static const _cities = ['Алматы', 'Астана', 'Шымкент'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _date ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );
    if (picked != null) setState(() => _date = picked);
  }

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}.${d.year}';

  /// Кнопка «Отправить»: показывает все введённые данные в информационном окне.
  void _submit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ваша заявка отправлена!'),
        content: Text(
          'ФИО: ${_nameController.text}\n'
          'Email: ${_emailController.text}\n'
          'Город: $_city\n'
          'Формат участия: ${_format == Format.online ? 'Онлайн' : 'Офлайн'}\n'
          'Дата посещения: ${_date == null ? 'не выбрана' : _formatDate(_date!)}\n'
          'Уровень опыта: ${_experience.round()} из 10\n'
          'Нужен обед: ${_needLunch ? 'Да' : 'Нет'}\n'
          'Согласие с правилами: ${_agree ? 'Да' : 'Нет'}',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Ok')),
        ],
      ),
    );
  }

  Widget _section(String title) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 8),
        child: Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(letterSpacing: 1.2)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        actions: [
          IconButton(
            tooltip: 'Выйти',
            icon: const Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Заполните данные для участия в IT-конференции', textAlign: TextAlign.center),
          _section('ЛИЧНЫЕ ДАННЫЕ'),
          // 1. ФИО — TextField
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'ФИО',
              hintText: 'Иванов Иван Иванович',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          // 2. Email — TextField
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'example@it-conf.kz',
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(),
            ),
          ),
          _section('МЕСТОПОЛОЖЕНИЕ'),
          // 3. Город — DropdownButtonFormField
          DropdownButtonFormField<String>(
            value: _city,
            decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Город'),
            items: _cities.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
            onChanged: (v) => setState(() => _city = v!),
          ),
          _section('ФОРМАТ УЧАСТИЯ'),
          // 4. Формат — RadioListTile
          RadioListTile<Format>(
            title: const Text('Онлайн'),
            subtitle: const Text('Трансляция и чат'),
            value: Format.online,
            groupValue: _format,
            onChanged: (v) => setState(() => _format = v!),
          ),
          RadioListTile<Format>(
            title: const Text('Офлайн'),
            subtitle: const Text('Личное присутствие в зале'),
            value: Format.offline,
            groupValue: _format,
            onChanged: (v) => setState(() => _format = v!),
          ),
          _section('ГРАФИК'),
          // 5. Дата посещения — кнопка с DatePicker
          OutlinedButton.icon(
            onPressed: _pickDate,
            icon: const Icon(Icons.calendar_month),
            label: Text(_date == null ? 'Выбрать дату посещения' : _formatDate(_date!)),
          ),
          _section('УРОВЕНЬ ОПЫТА (1–10)'),
          // 6. Опыт — Slider
          Slider(
            value: _experience,
            min: 1,
            max: 10,
            divisions: 9,
            label: _experience.round().toString(),
            onChanged: (v) => setState(() => _experience = v),
          ),
          _section('ДОПОЛНИТЕЛЬНО'),
          // 7. Обед — SwitchListTile
          SwitchListTile(
            title: const Text('Нужен обед'),
            value: _needLunch,
            onChanged: (v) => setState(() => _needLunch = v),
          ),
          // Согласие — CheckboxListTile
          CheckboxListTile(
            title: const Text('Согласен с правилами мероприятия'),
            subtitle: const Text('Обязательно для участия'),
            value: _agree,
            onChanged: (v) => setState(() => _agree = v ?? false),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _submit,
            style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
            child: const Text('Отправить'),
          ),
        ],
      ),
    );
  }
}
