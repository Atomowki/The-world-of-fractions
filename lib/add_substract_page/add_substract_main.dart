import 'package:flutter/material.dart';
import 'package:the_world_of_fractions/add_substract_page/add_learn_page.dart';
import 'package:the_world_of_fractions/add_substract_page/add_substract_page.dart';

class AddMain extends StatefulWidget {
  const AddMain({super.key});

  @override
  State<AddMain> createState() => _AddMainState();
}

class _AddMainState extends State<AddMain> {
  int selectedIndex = 0;
  static const List widgetOptions = [
    AddLearnPage(),
    AddSubstractPage(),
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
