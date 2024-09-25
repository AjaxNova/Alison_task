import 'package:flutter/material.dart';

class TitlesWidget extends StatelessWidget {
  final String title;

  const TitlesWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
      ),
      trailing: const Text(
        'View All',
        style: TextStyle(decoration: TextDecoration.underline, fontSize: 14),
      ),
    );
  }
}
