import 'package:flutter/material.dart';

class WeddingPageDetail extends StatelessWidget {
  final String title;
  final List<Widget> details;

  WeddingPageDetail({
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: details,
      ),
    );
  }
}
