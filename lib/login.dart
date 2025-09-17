import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Hello, World!'),
        Icon(Icons.star),
        SizedBox.shrink(),
        Card(child: Text('Card Content')),
      ],
    );
  }
}