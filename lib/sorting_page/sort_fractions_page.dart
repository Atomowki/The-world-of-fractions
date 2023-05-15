import 'package:flutter/material.dart';
import 'package:the_world_of_fractions/reusables/fraction.dart';
import 'package:the_world_of_fractions/reusables/my_app_bar.dart';

class SortFractionsPage extends StatelessWidget {
  const SortFractionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: GridPaper(
          color: Colors.blue,
          interval: 200,
          divisions: 1,
          subdivisions: 8,
          child: Column(
            children: const [
              Fraction(
                downSymbol: '4',
                upperSymbol: '7',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
