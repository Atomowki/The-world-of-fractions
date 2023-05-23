import 'package:flutter/material.dart';
import 'package:the_world_of_fractions/reusables/fraction.dart';
import 'package:the_world_of_fractions/reusables/my_app_bar.dart';

class SortFractionsPage extends StatelessWidget {
  const SortFractionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Column(
        children: [
          Draggable<Fraction>(
            feedback: const Fraction(
              upperSymbol: '2137',
              downSymbol: '420',
            ),
            childWhenDragging: Container(
              color: Colors.white,
            ),
            child: const Fraction(
              upperSymbol: '2137',
              downSymbol: '420',
            ),
          ),
          DragTarget<Fraction>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return Container(
                height: 100.0,
                width: 100.0,
                color: Colors.cyan,
              );
            },
          ),
        ],
      ),
    );
  }
}
