import 'package:flutter/material.dart';
import 'package:the_world_of_fractions/test_path/level_one.dart';

import '../add_substract_page/add_substract_page.dart';
import '../multiplication_division_page/multiplication_division_page.dart';
import '../reducing_fractions_page/reducing_fractions_page.dart';
import '../reusables/su_primary_button.dart';
import '../sorting_page/sort_fractions_page.dart';

class TestPath extends StatefulWidget {
  const TestPath({super.key});

  @override
  State<TestPath> createState() => _TestPathState();
}

class _TestPathState extends State<TestPath> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ścieżka Testowa",
        ),
        actions: [
          SizedBox(
            child: Image.asset(
              'assets/images/panSpinacz.png',
            ),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 80,
            ),
            SUPrimaryButton(
              text: "Poziom 1",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LevelOne(),
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
