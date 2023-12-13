import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';
import 'package:flutter_tex/flutter_tex.dart';

class ReducingFractionsExercisesPage extends StatefulWidget {
  const ReducingFractionsExercisesPage({super.key});

  @override
  ReducingFractionsPageState createState() => ReducingFractionsPageState();
}

class ReducingFractionsPageState extends State<ReducingFractionsExercisesPage> {
  List<Map<String, dynamic>> examples = [
    {'number': r'\(\frac{3}{6}\)', 'result': Fraction(1, 2)},
    {'number': r'\(\frac{7}{14}\)', 'result': Fraction(1, 2)},
    {'number': r'\(\frac{6}{16}\)', 'result': Fraction(3, 8)},
    {'number': r'\(\frac{21}{24}\)', 'result': Fraction(7, 8)},
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
            Container(
              height: 30.0,
              child: TeXView(
                renderingEngine: TeXViewRenderingEngine.katex(),
                child: TeXViewDocument(examples[index]['number']),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    results[index] = null;
                  } else {
                    Fraction answer = Fraction.fromString(value);
                    results[index] = answer.toString() ==
                        examples[index]['result'].reduce().toString();
                  }
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
