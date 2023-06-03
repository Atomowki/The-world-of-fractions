import 'package:flutter/material.dart';
import 'package:the_world_of_fractions/reusables/my_app_bar.dart';

class AddSubstractPage extends StatefulWidget {
  const AddSubstractPage({super.key});

  @override
  AddSubstractPageState createState() => AddSubstractPageState();
}

class AddSubstractPageState extends State<AddSubstractPage> {
  List<Map<String, dynamic>> equations = const [
    {'equation': '16 + 17', 'result': 33},
    {'equation': '33 + 77', 'result': 110},
    {'equation': '29 - 13', 'result': 16},
    {'equation': '420 - 69', 'result': 351},
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
        padding: const EdgeInsets.all(16.0),
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
                  results[index] = int.tryParse(value) == equations[index]['result'];
                });
              },
              keyboardType: TextInputType.number,
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
