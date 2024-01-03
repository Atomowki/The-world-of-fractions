import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:the_world_of_fractions/reusables/import_examples.dart';

class AddSubstractPage extends StatefulWidget {
  const AddSubstractPage({super.key});

  @override
  AddSubstractPageState createState() => AddSubstractPageState();
}

class AddSubstractPageState extends State<AddSubstractPage> {
  List<Map<String, dynamic>> equations = [
    {'equation': r'\(\frac{1}{2} + \frac{1}{3}\)', 'result': Fraction(5, 6)},
    {'equation': r'\(\frac{3}{7} + \frac{4}{14}\)', 'result': Fraction(5, 7)},
    {'equation': r'\(\frac{3}{4} - \frac{1}{2}\)', 'result': Fraction(1, 4)},
    {'equation': r'\(\frac{7}{10} - \frac{2}{5}\)', 'result': Fraction(3, 10)},
  ];

  List<bool?> results = List.generate(4, (_) => null);

  @override
  Widget build(BuildContext context) {
    bool allAnswersCorrect = results.every((result) => result == true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodawanie i Odejmowanie'),
        actions: [
          SizedBox(
            child: CSVUploader(
              buttonText: 'Importuj przykłady',
              onDataLoaded: (data) {
                if(data.isNotEmpty) {
                  for(List<dynamic> line in data) {
                    if(line.length != 7) {
                      continue;
                    }

                    var expectedResult = Fraction(int.parse(line[5]),int.parse(line[6]));

                    var equation = r'\(\frac{' + line[0] + '}{' + line[1] + '} ' + line[2] + r'\frac{' + line[3] + '}{' + line[4] + r'}\)';

                    equations.add( {
                      'equation': equation,
                      'result': expectedResult
                    });

                    results.add(null);
                  }
                }
                setState(() {});
              }
            )
          ),
          SizedBox(
            child: Image.asset('assets/images/panSpinacz.png'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Column(
              children: [
                for (int i = 0; i < equations.length; i++) ...[
                  buildEquationCard(i),
                  const SizedBox(height: 16),
                ],
              ],
            ),
              const SizedBox(height: 16),
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
                  child: TeXViewDocument(equations[index]['equation']),
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
                    results[index] = answer == equations[index]['result'];
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
