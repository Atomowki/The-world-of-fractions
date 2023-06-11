import 'package:flutter/material.dart';

class Fraction extends StatelessWidget {
  const Fraction({
    super.key,
    required this.upperSymbol,
    required this.downSymbol,
  });

  final String upperSymbol;
  final String downSymbol;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(upperSymbol),
          Container(
            height: 2,
            width: 50,
            color: Colors.blue,
          ),
          Text(downSymbol)
        ],
      ),
    );
  }
}
