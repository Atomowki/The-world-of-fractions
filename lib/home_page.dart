import 'package:flutter/material.dart';
import 'package:the_world_of_fractions/add_substract_page/add_substract_page.dart';
import 'package:the_world_of_fractions/common_denominator_page/common_denominator_page.dart';
import 'package:the_world_of_fractions/multiplication_division_page/multiplication_division_page.dart';
import 'package:the_world_of_fractions/reducing_fractions_page/reducing_fractions_page.dart';
import 'package:the_world_of_fractions/reusables/su_primary_button.dart';
import 'package:the_world_of_fractions/sorting_page/sort_fractions_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Świat Ułamków"),
        actions: [
          SizedBox(
            child: Image.asset('assets/images/panSpinacz.png'),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Witaj w świecie ułamków",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 80,
            ),
            SUPrimaryButton(
              text: "Sortowanie",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SortFractionsPage(),
                  ),
                );
              },
            ),
            SUPrimaryButton(
              text: "Dodawanie i odejmowanie",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddSubstractPage(),
                  ),
                );
              },
            ),
            SUPrimaryButton(
              text: "Mnożenie i dzielenie",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MultiplicationDivisionPage(),
                  ),
                );
              },
            ),
            SUPrimaryButton(
              text: "Skracanie ułamków",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ReducingFractionsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
