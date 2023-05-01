import 'package:flutter/material.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Świat ułamków',
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'Autour'),
      home: const MyHomePage(title: 'Świat ułamków'),
    );
  }
}
