import 'package:flutter/material.dart';
import 'package:the_world_of_fractions/reducing_fractions_page/reducing_fractions_exercises_page/reducing_fractions_excercises_page.dart';
import 'package:the_world_of_fractions/reducing_fractions_page/reducing_fractions_learn_page/reducing_fractions_learn_page.dart';

class ReducingFractionsPage extends StatefulWidget {
  const ReducingFractionsPage({super.key});

  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  State<StatefulWidget> createState() => _SelectModeState();
}

class _SelectModeState extends State<ReducingFractionsPage> {
  int selectedIndex = 0;
  static const List widgetOptions = [
    ReducingFractionsLearnPage(),
    ReducingFractionsExercisesPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skracanie Ułamków",),
        actions: [
          SizedBox(
            child: Image.asset('assets/images/panSpinacz.png',),
          )
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: 'Ucz się',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            label: 'Ćwiczenia',
          )
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: onItemTapped,
      ),
    );
  }
}
