import 'package:flutter/material.dart';
import 'package:the_world_of_fractions/multiplication_division_page/multi_learn.dart';
import 'package:the_world_of_fractions/multiplication_division_page/multiplication_division_page.dart';

class MultiMain extends StatefulWidget {
  const MultiMain({super.key});

  @override
  State<MultiMain> createState() => _MultiMainState();
}

class _MultiMainState extends State<MultiMain> {
  int selectedIndex = 0;
  static const List widgetOptions = [
    MultiLearn(),
    MultiplicationDivisionPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
