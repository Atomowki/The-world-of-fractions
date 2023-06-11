import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';

class AddSubstractPage extends StatefulWidget {
  const AddSubstractPage({super.key});

  @override
  AddSubstractPageState createState() => AddSubstractPageState();
}

class AddSubstractPageState extends State<AddSubstractPage> {
  List<Map<String, dynamic>> equations = [
    {'equation': '1/2 + 1/3', 'result': Fraction(5, 6)},
    {'equation': '3/7 + 4/14', 'result': Fraction(5, 7)},
    {'equation': '3/4 - 1/2', 'result': Fraction(1, 4)},
    {'equation': '7/10 - 2/5', 'result': Fraction(3, 10)},
  ];

  List<bool?> results = List.filled(4, null);

  @override
  Widget build(BuildContext context) {
    bool allAnswersCorrect = results.every((result) => result == true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodawanie i Odejmowanie'),
        actions: [
          SizedBox(
            child: Image.asset('assets/images/panSpinacz.png'),
          )
        ],
      ),
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
            for (int i = 0; i < equations.length; i++) ...[
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
              equations[index]['equation'],
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                setState(() {
                  Fraction answer = Fraction.fromString(value);
                  results[index] = answer == equations[index]['result'];
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
                results[index]! ? 'Gratulacje!' : 'Niestety źle :(',
                style: TextStyle(
                  color: results[index]! ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
