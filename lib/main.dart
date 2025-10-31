import 'dart:math'; // Імпортуємо бібліотеку для генерації випадкових чисел
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceRollerApp());
}

class DiceRollerApp extends StatelessWidget {
  const DiceRollerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const DiceRollerPage(),
    );
  }
}

class DiceRollerPage extends StatefulWidget {
  const DiceRollerPage({super.key});

  @override
  State<DiceRollerPage> createState() => _DiceRollerPageState();
}

class _DiceRollerPageState extends State<DiceRollerPage> {
  // Змінна стану, що зберігає поточне значення кубика.
  int _diceValue = 1;

  // Об'єкт для генерації випадкових чисел
  final Random _random = Random();

  // Функція, яка буде викликатись при натисканні на кнопку
  void _rollDice() {
    // setState - метод, який повідомляє Flutter, що стан змінився
    setState(() {
      // Генеруємо випадкове число від 0 до 5, додаємо 1, щоб отримати значення від 1 до 6
      _diceValue = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900], // Темний фон
      appBar: AppBar(
        title: const Text('Dice Roller 🎲'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Центруємо все по вертикалі
          children: <Widget>[
            // Віджет для відображення зображення з папки assets
            Image.asset(
              'assets/dice-$_diceValue.png',
              width: 200, // Встановлюємо ширину, щоб зображення не було занадто великим
              semanticLabel: 'Зображення кубика зі значенням $_diceValue',
            ),
            
            const SizedBox(height: 40), // Відступ між зображенням та кнопкою
            
            // Кнопка для кидка
            ElevatedButton(
              onPressed: _rollDice, // При натисканні викликаємо нашу функцію
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Кинути кубик!'),
            ),
          ],
        ),
      ),
    );
  }
}