import 'package:flutter/material.dart';

class MenuPageDetail extends StatelessWidget {
  final String title;
  final String details;

  MenuPageDetail({
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              children: _formatDetails(details),
            ),
          ),
        ),
      ),
    );
  }

  List<TextSpan> _formatDetails(String details) {
    final List<String> boldSections = [
      'Set Menu',
      'Trilogy of Hot & Cold Combination',
      'Soup',
      'Mains',
      'Dessert',
      'Epicurean Set Menu',
      'Buffet Menu',
      'Appetizer',
      'From The Garden',
      'Breads & Butter',
      'Hot Buffet Station',
      'Salad & Appetizers',
      'Trilogy Mains',
      'Muhibbah Set Menu',
    ];

    List<TextSpan> spans = [];
    details.split('\n').forEach((line) {
      bool isBold = boldSections.any((section) => line.contains(section));
      spans.add(TextSpan(
        text: line + '\n',
        style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      ));
    });

    return spans;
  }
}
