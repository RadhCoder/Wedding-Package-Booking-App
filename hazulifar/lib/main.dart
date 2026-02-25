import 'package:flutter/material.dart';
import 'Hazulifar_theme.dart';
import 'display/home.dart';

void main() {
  runApp(const Hazulifar());
}

class Hazulifar extends StatelessWidget {
  const Hazulifar({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = HazulifarTheme.light();
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: theme,
      title: 'Hazulifar Wedding',
      home: const Home(),
    );
  }
}
