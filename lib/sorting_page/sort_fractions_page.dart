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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Column(
        children: [
          SUPrimaryButton(
            text: "Sprawadź",
            onPressed: () {
              if (true) {
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
                  msg: "meh",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            },
          )
        ],
      ),
    );
  }

  int compareFractions(Fraction f1, Fraction f2) {
    var f1Up = int.parse(f1.upperSymbol);
    var f1Dw = int.parse(f1.downSymbol);

    var f2Up = int.parse(f2.upperSymbol);
    var f2Dw = int.parse(f2.downSymbol);

    double calc1 = f1Up / f1Dw;
    double calc2 = f2Up / f2Dw;
    print(calc1);
    print(calc2);
    print("wynik = ${calc1.compareTo(calc2)}");
    return calc1.compareTo(calc2);
  }
}
