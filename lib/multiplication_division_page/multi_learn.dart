import 'package:flutter/material.dart';

class MultiLearn extends StatefulWidget {
  const MultiLearn({super.key});

  @override
  State<MultiLearn> createState() => _MultiLearnState();
}

class _MultiLearnState extends State<MultiLearn> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          const Text(
            "Aby pomnożyć dwa ułamki zwykłe, należy pomnożyć licznik przez licznik, a mianownik przez mianownik: ",
          ),
          SizedBox(
            child: Image.asset('assets/images/mn1.png'),
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            "Aby podzielić dwa ułamki zwykłe, należy pierwszy ułamek pomnożyć przez odwrotnośc drugiego: ",
          ),
          SizedBox(
            child: Image.asset('assets/images/mn2.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Zapraszamy do ćwiczeń :)",
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
