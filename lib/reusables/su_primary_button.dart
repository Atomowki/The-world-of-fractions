// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SUPrimaryButton extends StatelessWidget {
  const SUPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              18.0,
            ),
          ),
        ),
        shadowColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
        elevation: MaterialStateProperty.all(
          0.0,
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
