import 'package:flutter/material.dart';

class AddLearnPage extends StatefulWidget {
  const AddLearnPage({super.key});

  @override
  State<AddLearnPage> createState() => _AddLearnPageState();
}

class _AddLearnPageState extends State<AddLearnPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          const Text(
            "Dodawanie ułamków o tym samym mianowniku: ",
          ),
          SizedBox(
            child: Image.asset('assets/images/dod.png'),
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            "By dodać ułamki o różnych mianownikach najpierw sprowadź ułamki do wspólnego mianownika: ",
          ),
          SizedBox(
            child: Image.asset('assets/images/dod2.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Tutaj widzisz, że jak pomnoży się mianowniki, to otrzymuje się wspólny mianownik 6.",
          ),
          SizedBox(
            child: Image.asset('assets/images/dod3.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Na bardzo podobnej zasadzie działa odejmowanie ułamków zwykłych: ",
          ),
          SizedBox(
            child: Image.asset('assets/images/ode.png'),
            height: 250,
            width: 500,
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
