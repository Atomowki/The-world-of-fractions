import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_world_of_fractions/reusables/su_primary_button.dart';

import '../reusables/fraction.dart';
import '../reusables/my_app_bar.dart';

class SortFractionsPage extends StatefulWidget {
  const SortFractionsPage({super.key});

  @override
  State<SortFractionsPage> createState() => _SortFractionsPageState();
}

class _SortFractionsPageState extends State<SortFractionsPage> {
  List<String> symbols = ["<", ">"];
  Fraction f1 = const Fraction(upperSymbol: "1", downSymbol: "2");
  Fraction f2 = const Fraction(upperSymbol: "2", downSymbol: "3");

  @override
  Widget build(BuildContext context) {
    String symbol = symbols[0];

    final answer = compareFractions(f1, f2, symbol);
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              f1,
              Text(
                symbols[0],
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
              f2,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SUPrimaryButton(
                text: "Prawda",
                onPressed: () {
                  checkAnswer(f1, f2, answer, symbol, true);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              SUPrimaryButton(
                text: "Nieprawda",
                onPressed: () {
                  checkAnswer(f1, f2, answer, symbol, false);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool compareFractions(Fraction f1, Fraction f2, String symbol) {
    var f1Up = int.parse(f1.upperSymbol);
    var f1Dw = int.parse(f1.downSymbol);

    var f2Up = int.parse(f2.upperSymbol);
    var f2Dw = int.parse(f2.downSymbol);

    double calc1 = f1Up / f1Dw;
    double calc2 = f2Up / f2Dw;
    print(calc1);
    print(calc2);
    print("wynik = ${calc1.compareTo(calc2)}");

    bool answer = false;
    switch (symbol) {
      case "<":
        answer = calc1 < calc2;
        print("case 1:  ${answer}");
        break;
      case ">":
        answer = calc1 > calc2;
        print("case 2:  ${answer}");
        break;
      default:
    }
    print(answer);
    return answer;
  }

  void checkAnswer(
      Fraction f1, Fraction f2, bool answer, String symbol, bool tryAnswer) {
    bool compare = compareFractions(f1, f2, symbol);
    if (compare == tryAnswer) {
      Fluttertoast.showToast(
        msg: "Udało się",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Nie powiodło się",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
