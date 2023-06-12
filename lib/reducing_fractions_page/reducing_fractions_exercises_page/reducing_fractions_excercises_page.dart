import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';

class ReducingFractionsExercisesPage extends StatefulWidget {
  const ReducingFractionsExercisesPage({super.key});

  @override
  ReducingFractionsPageState createState() => ReducingFractionsPageState();
}

class ReducingFractionsPageState extends State<ReducingFractionsExercisesPage> {
  List<Map<String, dynamic>> examples = [
    {'number': '3/6', 'result': Fraction(1, 2)},
    {'number': '7/14', 'result': Fraction(1, 2)},
    {'number': '6/16', 'result': Fraction(3, 8)},
    {'number': '21/24', 'result': Fraction(7, 8)},
  ];

  List<bool?> results = List.filled(4, null);

  @override
  Widget build(BuildContext context) {
    bool allAnswersCorrect = results.every((result) => result == true);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Witaj! Rozwiąż poniższe równania i wprowadź swoje odpowiedzi:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Uwaga! Odpowiedź wpisz w postaci ułamka zwykłego (np. 1/2 zamiast 0.5)',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < examples.length; i++) ...[
              buildEquationCard(i),
              const SizedBox(height: 16),
            ],
            if (allAnswersCorrect)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Dobra robota! Rozwiązałeś poprawnie wszystkie działania :)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildEquationCard(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              examples[index]['number'],
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                setState(() {
                  Fraction answer = Fraction.fromString(value);
                  results[index] = answer.toString() ==
                      examples[index]['result'].reduce().toString();
                });
              },
              decoration: const InputDecoration(
                hintText: 'Wprowadź odpowiedź',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            if (results[index] != null)
              Text(
                results[index]! ? 'Dobrze!' : 'Zła odpowiedź :(',
                style: TextStyle(
                  color: results[index]! ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )
          ],
        ),
      ),
    );
  }
}
